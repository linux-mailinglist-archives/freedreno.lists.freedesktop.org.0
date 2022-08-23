Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA0859DAAA
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 12:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E01B33C8;
	Tue, 23 Aug 2022 10:29:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 393 seconds by postgrey-1.36 at gabe;
 Tue, 23 Aug 2022 10:29:16 UTC
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4CFB33B3
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 10:29:16 +0000 (UTC)
Received: from [192.168.1.101] (afbd223.neoplus.adsl.tpnet.pl [95.49.29.223])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3C4D33F63E;
 Tue, 23 Aug 2022 12:22:38 +0200 (CEST)
Message-ID: <3eaa26a5-dde7-06e7-f47d-cb836fbd495d@somainline.org>
Date: Tue, 23 Aug 2022 12:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] arm64: dts: qcom: sm8250: move DSI opp
 table to the dsi0 node
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 22.08.2022 21:11, Dmitry Baryshkov wrote:
> It makes no sense to have the OPP table for the DSI controllers in the
> DSI1 PHY node. Move it to more logical dsi0 device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad

>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 38 ++++++++++++++--------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index bc773e210023..5843e46a3164 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3571,6 +3571,25 @@ dsi0_out: endpoint {
>  						};
>  					};
>  				};
> +
> +				dsi_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-187500000 {
> +						opp-hz = /bits/ 64 <187500000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-300000000 {
> +						opp-hz = /bits/ 64 <300000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
>  			};
>  
>  			dsi0_phy: dsi-phy@ae94400 {
> @@ -3663,25 +3682,6 @@ dsi1_phy: dsi-phy@ae96400 {
>  				clock-names = "iface", "ref";
>  
>  				status = "disabled";
> -
> -				dsi_opp_table: opp-table {
> -					compatible = "operating-points-v2";
> -
> -					opp-187500000 {
> -						opp-hz = /bits/ 64 <187500000>;
> -						required-opps = <&rpmhpd_opp_low_svs>;
> -					};
> -
> -					opp-300000000 {
> -						opp-hz = /bits/ 64 <300000000>;
> -						required-opps = <&rpmhpd_opp_svs>;
> -					};
> -
> -					opp-358000000 {
> -						opp-hz = /bits/ 64 <358000000>;
> -						required-opps = <&rpmhpd_opp_svs_l1>;
> -					};
> -				};
>  			};
>  		};
>  
