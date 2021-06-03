Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A4239AD4C
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 23:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE5A6F510;
	Thu,  3 Jun 2021 21:56:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315D66F510
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 21:56:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622757400; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=85uDWnmNo6inlorp38hf6id8NLKbX4u0nc6nTll7g+0=;
 b=bMFcLdDxBR/xHNwJ1Oivhc/CTJCm18mdLgPZ95LN9a4RmSkU5j+AjzVsmov4SvVKu1GyMEtJ
 VqQp80mPwQOMt6xwKm5MELZFmW7XkZKi7GmggFHxlmrEXFt06DpZoB4EMch804WRT/MSKEkQ
 sapC9OrmydKQnAszwLgn+zCyTds=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60b95016f726fa41884c10a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Jun 2021 21:56:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B8752C43460; Thu,  3 Jun 2021 21:56:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D4F1C433D3;
 Thu,  3 Jun 2021 21:56:36 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 03 Jun 2021 14:56:36 -0700
From: khsieh@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <YLkI/6ItCz+SbbuJ@yoga>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
 <YLkI/6ItCz+SbbuJ@yoga>
Message-ID: <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH v2] arm64/dts/qcom/sc7180: Add Display Port
 dt node
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 vkoul@kernel.org, robh+dt@kernel.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-06-03 09:53, Bjorn Andersson wrote:
> On Thu 03 Jun 11:09 CDT 2021, Kuogee Hsieh wrote:
> 
>> Add DP device node on sc7180.
>> 
>> Changes in v2:
>> -- replace msm_dp with dp
>> -- replace dp_opp_table with opp_table
>> 
> 
> I'm sorry for those suggestions, I don't like either one of them.
> 
> And for everything but changes to the DRM code the changelog goes below
> the --- line, so it's not part of the git history.
> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  9 ++++
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 78 
>> ++++++++++++++++++++++++++++
>>  2 files changed, 87 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> index 24d293e..40367a2 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> @@ -786,6 +786,15 @@ hp_i2c: &i2c9 {
>>  	status = "okay";
>>  };
>> 
>> +&dp {
>> +        status = "okay";
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&dp_hot_plug_det>;
>> +        data-lanes = <0 1>;
> 
> Is it a limitation of the EC in Trogdor that you can only do 2 lanes?
> 
>> +        vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
>> +        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
>> +};
>> +
>>  &pm6150_adc {
>>  	charger-thermistor@4f {
>>  		reg = <ADC5_AMUX_THM3_100K_PU>;
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 6228ba2..05a4133 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -3032,6 +3032,13 @@
>>  							remote-endpoint = <&dsi0_in>;
>>  						};
>>  					};
>> +
>> +					port@2 {
>> +						reg = <2>;
>> +						dpu_intf0_out: endpoint {
>> +							remote-endpoint = <&dp_in>;
>> +						};
>> +					};
>>  				};
>> 
>>  				mdp_opp_table: mdp-opp-table {
>> @@ -3148,6 +3155,77 @@
>> 
>>  				status = "disabled";
>>  			};
>> +
>> +			dp: displayport-controller@ae90000 {
> 
> If you label this "mdss_dp", then it will naturally group with other
> mdss properties in trogdor.dtsi (which should be sorted 
> alphabetically).
> 
>> +				compatible = "qcom,sc7180-dp";
>> +				status = "disabled";
>> +
>> +				reg = <0 0x0ae90000 0 0x1400>;
>> +
>> +				interrupt-parent = <&mdss>;
>> +				interrupts = <12>;
>> +
>> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +				clock-names = "core_iface", "core_aux", "ctrl_link",
>> +					      "ctrl_link_iface", "stream_pixel";
>> +				#clock-cells = <1>;
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
>> +				phys = <&dp_phy>;
>> +				phy-names = "dp";
>> +
>> +				operating-points-v2 = <&opp_table>;
>> +				power-domains = <&rpmhpd SC7180_CX>;
> 
> Just curious, but isn't the DP block in the MDSS_GDCS? Or do we need to
> mention CX here in order for the opp framework to apply required-opps
> of CX?

yes,
> 
>> +
>> +				#sound-dai-cells = <0>;
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +					port@0 {
>> +						reg = <0>;
>> +						dp_in: endpoint {
>> +							remote-endpoint = <&dpu_intf0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						dp_out: endpoint { };
>> +					};
>> +				};
>> +
>> +				opp_table: dp-opp-table {
> 
> The one and only "opp_table" of the sc7180 :)
> Maybe name it dp_opp_table instead?
> 
> Regards,
> Bjorn
> 
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-160000000 {
>> +						opp-hz = /bits/ 64 <160000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs>;
>> +					};
>> +
>> +					opp-270000000 {
>> +						opp-hz = /bits/ 64 <270000000>;
>> +						required-opps = <&rpmhpd_opp_svs>;
>> +					};
>> +
>> +					opp-540000000 {
>> +						opp-hz = /bits/ 64 <540000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +
>> +					opp-810000000 {
>> +						opp-hz = /bits/ 64 <810000000>;
>> +						required-opps = <&rpmhpd_opp_nom>;
>> +					};
>> +				};
>> +			};
>> +
>> +
>>  		};
>> 
>>  		dispcc: clock-controller@af00000 {
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
