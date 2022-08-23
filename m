Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A475A02D3
	for <lists+freedreno@lfdr.de>; Wed, 24 Aug 2022 22:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A68C7DC9;
	Wed, 24 Aug 2022 20:33:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B9D11BD01
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 15:15:36 +0000 (UTC)
Date: Tue, 23 Aug 2022 15:15:18 +0000
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="oF0ZlcI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1661267729; x=1661526929;
 bh=/a5Sr9z4hKMkNQE2RiJnMU4myUih+AbOa22vER9x60Q=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=oF0ZlcI3jQo3o5di1EQm3lYNC4ZqhwDt2qOck1QEd3v0d7RAxquP6nkgnHPYV2qdH
 WCLhYGe7AasNrtjbOhAQ5T2eDUEuE8wivgsavw8lBv3oJx4G/En4bdzrv0l4DQ91z1
 jRkymxY7CQP77zuG7VMoO5V3GzOsRFNQdl/aK/8Q=
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
From: Caleb Connolly <caleb@connolly.tech>
Message-ID: <2af8e228-5334-d5fe-eee5-2067d84481dc@connolly.tech>
In-Reply-To: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
References: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 22/08/2022 20:11, Dmitry Baryshkov wrote:
> It makes no sense to have the OPP table for the DSI controllers in the
> DSI1 PHY node. Move it to more logical dsi0 device node.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Caleb Connolly <caleb@connolly.tech>

> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 38 ++++++++++++++--------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> index bc773e210023..5843e46a3164 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3571,6 +3571,25 @@ dsi0_out: endpoint {
>   =09=09=09=09=09=09};
>   =09=09=09=09=09};
>   =09=09=09=09};
> +
> +=09=09=09=09dsi_opp_table: opp-table {
> +=09=09=09=09=09compatible =3D "operating-points-v2";
> +
> +=09=09=09=09=09opp-187500000 {
> +=09=09=09=09=09=09opp-hz =3D /bits/ 64 <187500000>;
> +=09=09=09=09=09=09required-opps =3D <&rpmhpd_opp_low_svs>;
> +=09=09=09=09=09};
> +
> +=09=09=09=09=09opp-300000000 {
> +=09=09=09=09=09=09opp-hz =3D /bits/ 64 <300000000>;
> +=09=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs>;
> +=09=09=09=09=09};
> +
> +=09=09=09=09=09opp-358000000 {
> +=09=09=09=09=09=09opp-hz =3D /bits/ 64 <358000000>;
> +=09=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs_l1>;
> +=09=09=09=09=09};
> +=09=09=09=09};
>   =09=09=09};
>
>   =09=09=09dsi0_phy: dsi-phy@ae94400 {
> @@ -3663,25 +3682,6 @@ dsi1_phy: dsi-phy@ae96400 {
>   =09=09=09=09clock-names =3D "iface", "ref";
>
>   =09=09=09=09status =3D "disabled";
> -
> -=09=09=09=09dsi_opp_table: opp-table {
> -=09=09=09=09=09compatible =3D "operating-points-v2";
> -
> -=09=09=09=09=09opp-187500000 {
> -=09=09=09=09=09=09opp-hz =3D /bits/ 64 <187500000>;
> -=09=09=09=09=09=09required-opps =3D <&rpmhpd_opp_low_svs>;
> -=09=09=09=09=09};
> -
> -=09=09=09=09=09opp-300000000 {
> -=09=09=09=09=09=09opp-hz =3D /bits/ 64 <300000000>;
> -=09=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs>;
> -=09=09=09=09=09};
> -
> -=09=09=09=09=09opp-358000000 {
> -=09=09=09=09=09=09opp-hz =3D /bits/ 64 <358000000>;
> -=09=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs_l1>;
> -=09=09=09=09=09};
> -=09=09=09=09};
>   =09=09=09};
>   =09=09};
>
> --
> 2.35.1
>

--
Kind Regards,
Caleb

