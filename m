Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954B0ABB2B7
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 03:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEAC10E205;
	Mon, 19 May 2025 01:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVTnjCUX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AC810E1F3
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 01:01:32 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IMZkw1020609
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 01:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qq9RXq9SVzhhh+kL9lJzrgG+
 A/t/p+ZZEkzTdEVAQYI=; b=mVTnjCUXa5nvUgocAAsfyqzqSHq0o/ZsrB7cSvyZ
 jFwEejGeYLsqI/9Y1hn7ZtgNMetBkmKgaCHqwfqCMQ+a6OCD4yplgMyd3OkJKHJ2
 k5xg916aQRkGOfnuapKCbpGLs1dF3cAJZwsUmVCwBIK9eNxMpY/ehodoYLm/ykh4
 deZ/V2DM7HlNWiJvEyUnaQv2uWsEmfl2CCL47Nwq8ZEujEqIULO2CII/oKKPE58V
 qUCFasPv2mUd5Zb6WKBfN+MwnvvI06F1b3ohcgrPoQoSagpUTJjRermeaj3uIqs7
 qXgkODFxX3Ko/j7aI8SYbRxDiuGxQNq5Bba9B0lbHkmiOg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkctp37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 01:01:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-476623ba226so66565211cf.0
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 18:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747616488; x=1748221288;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qq9RXq9SVzhhh+kL9lJzrgG+A/t/p+ZZEkzTdEVAQYI=;
 b=nG7vybrysIg6QJ4ph1Gvy8241AsjuPgEAVrJzSZ3yXwOvv368KEjYAQEo/VhU1JAsA
 /h66P7Ox9qtUsIdc8PPj+9vQHwSgOxW8950pmgACsJna9SScQrmACl9UBdpSAI4Y87zT
 GZ5SD2vnsBd55Y76sZ++8nvJeqgHzMvwLdWEO3vtwqL9LUkmUub4UynK/kPT4YicdBrH
 gTAIi2BlfSrJQi+SMR+IY9txQN7IPyXzj+o8lND1oOGvqpg+D5jofcqj+b1vISAJLK9F
 eRc5yQsReuOYXZbZNn45RMc4Bs3yVIXpuKUMmJqYTPUXgtIvNIW99/uEUKw1pckUhQLp
 Ai1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdZ/TJ/9t1oecMleeS6nZP8LjyqKilZ+qqRzfb7GGt/haAdclPgpUyTxSKdTBJuD/7PWL01rTSzaQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCAFjAs8qIKOZiiM3UpShtpjzmFSjdvvwxZuyO47kq5umStjKx
 8pYQ+gB8r9OrHal11QLMm4Lbvb195pq060oyCf/UAUZsUzCw65MA4n+/JOwAszndGb9A7+X7ltD
 qzRj6LmvS5No84zebuk09ogSnobDpuwGj42DuPySZYpxKXj6u7rYh17oo+5vuvkbbde0Fn44=
X-Gm-Gg: ASbGncuQbfPu2kA+unZ0lT+bfs7gRGP21UMgMjJLF27l6EeN/Vj//oTjSD2eLUTO7cm
 q2FnP5JhlKLthELK276VO9EsFkQR/UAKF82HvSm+i+bogtRySWC1slDBw7BSDp60ujkAdUTkHOF
 xkM46azk8I37+ZlOTNbTVP7tVEJ3Zyi1U1jdMCo2V1WkJWpJ/jzwl7udBIGZvRZHUZS8XWpmhBc
 3eg7wt9livzRnewKFohx4wJVmYVWHroKagJX7Hc/jqFa5TkhVA1fOMYT0azN87o+GbN4VrKuuzZ
 9tm+cmw7Ej0sbGUKL087NYVoIjzUzejUa1mNLBdJNJMAtfbWf6pgcyGjC+T46cMrFwpXr9eUGMc
 =
X-Received: by 2002:ad4:5f0d:0:b0:6f5:748e:c6f4 with SMTP id
 6a1803df08f44-6f8b087097dmr211392836d6.37.1747616488529; 
 Sun, 18 May 2025 18:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtM9T4XNbEFF8ECRVL2nou27yxJUbqWcJOM1bWrwp+s7uIIKSfzncgHPn8YqJw4vvYzHTGmg==
X-Received: by 2002:ad4:5f0d:0:b0:6f5:748e:c6f4 with SMTP id
 6a1803df08f44-6f8b087097dmr211392356d6.37.1747616488039; 
 Sun, 18 May 2025 18:01:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f161b1sm1638412e87.16.2025.05.18.18.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 18:01:27 -0700 (PDT)
Date: Mon, 19 May 2025 04:01:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <amakhija@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
 robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
Message-ID: <tjp2pfescczqikbu2tzylx4ecb3n6trixvhbdwbpz6y4jc52wk@fmkdxrelun3i>
References: <20250513102611.1456868-1-amakhija@qti.qualcomm.com>
 <20250513102611.1456868-2-amakhija@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513102611.1456868-2-amakhija@qti.qualcomm.com>
X-Proofpoint-GUID: 9dgDvAWvQG7LWRRJIXb_zLG57c-EvfAv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDAwNyBTYWx0ZWRfXykYiOMhbW1+Y
 Pp32sLc7dyDrmjtqk8E/djwHuLqZwRmPP9kAX8AtUtaFMaLy6Ub2bd5cbhkS7dxhe4YaZ9JE7k/
 qbS52s0Yzb3Vj6cuq3nCoA06tLGqmjnW3ymyto2AoLgshF/nm8rGYAkDlIF/14o9du2Q0logLNe
 oRzluZf8Xgo1jUz6d8V3aeqegA3EUTQGFQC2kxvKTyg7y5zhMrWycUrjMk0y2YQSJ6bj++0YSaS
 gQ//2zbCWycbdYCdVu9B4j6bOfPs19VdNjeqK5r0K0e4wrqqop3znsnKUapL/aRzmPjX2cW2rqA
 z7TI7J1Be4mXztPVtJN/4/s7VXDf5lZy4NGtXFKd4DA9vX5ILgp2+eBuVBWKfVYnoo1s3KhBSwa
 qYRtnyVODG44U/Cf1t53hrt2XsiQgQUYquFvsRTE+8pIQ8fVcteznVbpevX8KLcjgKq8kxnL
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=682a82e9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sOAf8FZNR29loNffVzUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9dgDvAWvQG7LWRRJIXb_zLG57c-EvfAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_12,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190007
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

On Tue, May 13, 2025 at 03:56:10PM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Add device tree nodes for the DSI0 and DSI1 controllers
> with their corresponding PHYs found on Qualcomm SA8775P SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 186 +++++++++++++++++++++++++-
>  1 file changed, 185 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 5bd0c03476b1..f8777f17d24a 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
> @@ -4034,6 +4035,22 @@ dpu_intf4_out: endpoint {
>  							remote-endpoint = <&mdss0_dp1_in>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&mdss0_dsi0_in>;
> +						};
> +					};
> +
> +					port@3 {
> +						reg = <3>;
> +
> +						dpu_intf2_out: endpoint {
> +							remote-endpoint = <&mdss0_dsi1_in>;
> +						};
> +					};
>  				};
>  
>  				mdss0_mdp_opp_table: opp-table {
> @@ -4061,6 +4078,170 @@ opp-650000000 {
>  				};
>  			};
>  
> +			mdss0_dsi0: dsi@ae94000 {
> +				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +				reg = <0x0 0x0ae94000 0x0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss0>;
> +				interrupts = <4>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
> +							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
> +				phys = <&mdss0_dsi0_phy>;
> +
> +				operating-points-v2 = <&dsi0_opp_table>;
> +				power-domains = <&rpmhpd SA8775P_MMCX>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss0_dsi0_in: endpoint {
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss0_dsi0_out: endpoint{ };
> +					};
> +				};
> +
> +				dsi0_opp_table: opp-table {

mdss_dsi_opp_table: opp-table {}

> +					compatible = "operating-points-v2";
> +
> +					opp-358000000 {

Is there only one entry? Usually there are several.

> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
> +			};
> +
> +			mdss0_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
> +				reg = <0x0 0x0ae94400 0x0 0x200>,
> +				      <0x0 0x0ae94600 0x0 0x280>,
> +				      <0x0 0x0ae94900 0x0 0x27c>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +
> +			mdss0_dsi1: dsi@ae96000 {
> +				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +				reg = <0x0 0x0ae96000 0x0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss0>;
> +				interrupts = <5>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC1_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
> +							 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
> +				phys = <&mdss0_dsi1_phy>;
> +
> +				operating-points-v2 = <&dsi1_opp_table>;
> +				power-domains = <&rpmhpd SA8775P_MMCX>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss0_dsi1_in: endpoint {
> +							remote-endpoint = <&dpu_intf2_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss0_dsi1_out: endpoint { };
> +					};
> +				};
> +
> +				dsi1_opp_table: opp-table {

You don't need a second DSI OPP table.

> +					compatible = "operating-points-v2";
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
> +			};
> +
> +			mdss0_dsi1_phy: phy@ae96400 {
> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
> +				reg = <0x0 0x0ae96400 0x0 0x200>,
> +				      <0x0 0x0ae96600 0x0 0x280>,
> +				      <0x0 0x0ae96900 0x0 0x27c>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +
>  			mdss0_dp0_phy: phy@aec2a00 {
>  				compatible = "qcom,sa8775p-edp-phy";
>  
> @@ -4267,7 +4448,10 @@ dispcc0: clock-controller@af00000 {
>  				 <&sleep_clk>,
>  				 <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>,
>  				 <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>,
> -				 <0>, <0>, <0>, <0>;
> +				 <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
> +				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>,
> +				 <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
> +				 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
>  			power-domains = <&rpmhpd SA8775P_MMCX>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
