// Set Crowns Multiplier 2.x - 2022, pMarK

class CrownsMultiplier {

	private var inGameConfigWrapper : CInGameConfigWrapper;

	public function Init()
	{
		inGameConfigWrapper = theGame.GetInGameConfigWrapper();
	}

	public function GetIsModOn() : bool
	{
		return inGameConfigWrapper.GetVarValue('SCM', 'switch');
	}

	public function GetModifiedValue(value: int) : int
	{
		var multiplier: float;
		multiplier = GetCrownMultiplier();

		return (int)((float)value * multiplier);
	}

	private function GetCrownMultiplier() : float
	{
		var value: float;

		value = StringToFloat(inGameConfigWrapper.GetVarValue('SCM', 'mult'));

		if (value < 1.0f)
		{
			inGameConfigWrapper.SetVarValue('SWL', 'SWL', 1.0f);
			value = 1.0f;
		}

		return value;
	}
}