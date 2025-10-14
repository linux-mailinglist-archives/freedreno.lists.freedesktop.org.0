Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296D3BD8B58
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 12:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5E810E5A8;
	Tue, 14 Oct 2025 10:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GgYufA6Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396C810E134
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 10:18:09 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87FxF018068
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 10:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pwptx/VesgCBtJDbpJ0h31jG
 Os/N1oEOleOLOClW4QM=; b=GgYufA6ZQVAqzPGbedZW2BexYSPUaA55oJrvgezu
 A9V1NsT3tYXIon1derOce/NFCbGJTyXqdI57sTwCmYv2OtA8JS4JxzCKlkcm+8NJ
 IKDWONthUSPJIw0LBqR3s44PkHHF4loLfAOfFwJY9X9usWUii65PGa6AYrpPNtFi
 D2tdFwb1QHLECrwPzWxc0fiYLgorn/YOo8GJxPNPCrIVoysmRpFQ4lnyzu35aLtT
 RoiktZN2jiZorPe7y1eF2fvVcDvVkaPd2WBu6n16G2+0mu0HVygWJprXRsAVh07V
 Elu7sTtrHvrrxug7sGu0WEYeJ7Vz1By+4Mt0VxLnII811g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfes02w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 10:18:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-854bec86266so2393851585a.1
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 03:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760437087; x=1761041887;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pwptx/VesgCBtJDbpJ0h31jGOs/N1oEOleOLOClW4QM=;
 b=qQ3KENdKThWmvsT2IcmQlS/USR0XMhXu/YLL2cDEJKIYFcWck9t7Z1sfrR8sOmjDZX
 FQTYZ1X8By6QMH5erJHz/gxVgSE2yU0pCa7MhUY7dEEUhP9Evr3O1uS2HmPSdS8YbHef
 9SpRxt9qw5RmAyMOhOU6X5xBFNgoCGNo3rYICiDtqSdlkDyAk3hE9yRU4PfaU//PuJyK
 utC7thRKDgXSxQjl28fNuxzkQnHXDDhb21haggVuWnneKuJpeVQ8KUGxcVo8yxKb3vMP
 B1SEKHcZCMws7+vboIjkE08/G+MG8frFp67gR1bpTp2Vp2mxa+v2L9WO7EH08kIOusp5
 /5DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdEZ/xC6E2kvAW59Tt7Ce2iR6+4wBayAOWmhPvlsDJ6XWqFMSdzpW4YWnLYdVdwu7sFh5F4X5UP9M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxojbsgSBzwtCEsCFzrdWBIeHPVOnNAFnNAfcyyPfdJlmsrxKCa
 s6uoNAgydn/xGx866Z5sWypkleTEhIxkXbJahutwS1QlJs4+UKSv5cn4tIqtArVUIWbXP3V5ckL
 9eFEIvRfnIB73fxRuVc2CXpIU+jc4aJIRq0J6Q1iBzOX7yIT31pOvpEEyMvJFseFuxY1vhdQ=
X-Gm-Gg: ASbGncs5BmC+2xVgdL0IzGAsJkNbNFTifNo5YkJRF1jLz7E01fV4VymKpQFhvPj2WjK
 sSsbecurcuRzsNE53slcubwb5xuKauZO0Pl0iLCQndxbOm4MaGO8z7IzyHFTDHS3IHlaU8yWsRw
 AJAUb2AT2x5Oz/3N9gsAktsbxaW3/ZgqbcHofkaFR1OjjX9SGcC409Z9T+0L0GARwlbQTCihBv0
 ayoI4imKMTInHpcpki+oMH7o+xb7eBuHDcardxSiGO66c8W8RAqQO8Y12TRnSXUiFlUcVNKsFV9
 ksTFLt/gOF1t1A58biH7lRv7Dabutv6xUymEYAcmSzVNuY7EwT/yir815f/djcQsYR1Yjr3FbAT
 6l73mO73ij6sSRCHG2ccNgSwHscYIuny/DrwWJ5e6kw+kvCaEk1w/
X-Received: by 2002:a05:620a:25cf:b0:82e:ef43:38f0 with SMTP id
 af79cd13be357-8834d1ab25cmr3439239185a.0.1760437087168; 
 Tue, 14 Oct 2025 03:18:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJhGGgyvvXZT48tFGwd0V8RDCf9K7hHaMnSajQnKeeUDp+q+bm7eaDMfpNfVN/V/oft3MlEw==
X-Received: by 2002:a05:620a:25cf:b0:82e:ef43:38f0 with SMTP id
 af79cd13be357-8834d1ab25cmr3439234785a.0.1760437086684; 
 Tue, 14 Oct 2025 03:18:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762ea109afsm40265551fa.33.2025.10.14.03.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 03:18:05 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:18:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
Message-ID: <mij6av23fni6i4yb72xbjv3s2mil4eankjwt5n7jbafslvilem@qsk3644ilgcp>
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-2-1209df74d410@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v2-2-1209df74d410@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ee2360 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=j4UgqydKDgg0KIll92UA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: mzGZl1EdJ5kYiBvLrFhg-gUMuLW8iDSL
X-Proofpoint-ORIG-GUID: mzGZl1EdJ5kYiBvLrFhg-gUMuLW8iDSL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXwrk+r9kGr0jD
 EHgt//IC9IpQnuIn6UX+z/w71eSPe8VqUcuFmPvAc5/KiI6tGWEZnIB7gkV1dg9Gf0FC7uKctNc
 0V3LGa0NrzA497zd3NSPc1xl2/EVrhWCo7ShjEfZBUdP2ZajKn+o6RTtvjAwrNV7rkFy38LxT1m
 FmagQpwdRsUCSaLXG4D6ZlBz395tWt0zo2bQZpLCivDHtZVM8K/su606xL51Fel2aNLwC5AAadb
 +loxncp5gbKf1vKM6PQ4mJyIIDHwP+CiCQ+DQNb9pJJXr7vtBtDnFNGYn1Tnjs6BWWPl8LHRNAy
 ry+FitfYc7lDOVo4KQJtFzqcaYvLWafOoGORBSkQoyLhuLG3Tmmsj2ZU05UBO4z6TpYB4aCL6eP
 3jhz234fMOV2f4zvyaX6e59Qu3Bvag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Oct 14, 2025 at 05:42:11PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
> for SM6150 SoC. Update clock and endpoint connections to enable DP
> integration.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 110 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 108 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> index 6128d8c48f9c0807ac488ddac3b2377678e8f8c3..cdf53d74c778c652080b0288278353e20c317379 100644
> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> @@ -17,6 +17,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -3717,6 +3718,7 @@ port@0 {
>  						reg = <0>;
>  
>  						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp0_in>;
>  						};
>  					};
>  
> @@ -3749,6 +3751,84 @@ opp-307200000 {
>  				};
>  			};
>  
> +			mdss_dp0: displayport-controller@ae90000 {
> +				compatible = "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom,sm8350-dp";
> +
> +				reg = <0x0 0x0ae90000 0x0 0x200>,
> +				      <0x0 0x0ae90200 0x0 0x200>,
> +				      <0x0 0x0ae90400 0x0 0x600>,
> +				      <0x0 0x0ae90a00 0x0 0x600>,
> +				      <0x0 0x0ae91000 0x0 0x600>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel",
> +					      "stream_1_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +				assigned-clock-parents = <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;

Missing PIXEL1_CLK_SRC assignment

> +
> +				phys = <&usb_qmpphy_2 QMP_USB43DP_DP_PHY>;
> +				phy-names = "dp";
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dp0_out: endpoint {

I thought that we need a data-lanes property somewhere here.

> +						};
> +					};
> +				};
> +
-- 
With best wishes
Dmitry
