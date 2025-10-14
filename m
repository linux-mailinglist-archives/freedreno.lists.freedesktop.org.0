Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0400DBD8FE2
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 13:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC03110E216;
	Tue, 14 Oct 2025 11:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6qqLXBl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2846210E217
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 11:25:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Kft025794
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 11:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lB6sFQ3LeiBx00eAv9moG4oCFwLs4x2w8B2DPiD6Hkg=; b=f6qqLXBl9CpFDkBF
 RhNN9adguwXk6DD/nBJfQGSnXfPCr9mfRDJwKmkOhwBzumRbrjFW/5RE2K7PyivO
 dCCidrcSqjxY3vqARhVOCnUz6gX0E/O1L0NECosMXb7rcItIy3dBCoqzVZnsTY1x
 oDMNmidK7J2AsHzNUcwO7Dpx7hA8vRQM8LZ/NgmZKZeJ+xva3z5ZXOAFkeGxlXYg
 5aKCJcyu60uoIOxpkxW7wbWO3f/M53rdEcnNpqQU1HWiprzTtNXPoQ/vuwIwoih7
 h5dPeRLu3xC+u3ZUcO+7XsvFw49cRwhg4p/opOOzrl57jtWWn06MMe+3iBes2Fhr
 RAVNZg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg03ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 11:25:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-33b52a16294so2861735a91.2
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 04:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760441154; x=1761045954;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lB6sFQ3LeiBx00eAv9moG4oCFwLs4x2w8B2DPiD6Hkg=;
 b=DDMGxpfJNhbCLwAnJhw0rVX9tVDOljbUjasvwZaee/US4ddVx1SUjwRKBQUkdtWb8t
 z4+hBaE/qRgyyFJhwar+O7SmuDiCou7cq0QpeSILvk4reRJJLaPujSLiCKsFUHXLXLj4
 V+Z0Uj0vAdJSP7h75iTA1MVXoxqKcA11WGANr9A+58JclrKpMm4vx17t5Gx1CVYDsVrc
 /kFN4wiOBkjiirwoifIOGQxxsZtNJuu8KI/kTYBc6/3B9/ICI39oqgObvu0VoIrvHmjo
 17T/OPUv38Sf/0fPeeBbVbBfOflQCgZiMOPnYD5MMYgdntfaLGBI8HAH3BbguI7IEvPy
 tKSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxHMQw0qd5zN0TxKlenRVX+58fkyXNx50NmwqsBsM+5+xXAqy/eKKwnKkdAN2veKQgqMEaeZDBKFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb3rKtdAbk+TRczcFg5ZZHFHJmFmKfmTOOBrrWBfBWHj4tnCAb
 hzrilGkLGpC7CRsHs9u4hDgm0kn9XfJE69B1/Aim9k+roUn7FE1KQIummxVaSJ6Q/EbgIVr7q14
 BgMi69mCqPFK/W/G2E4y1qM8jQvcA6OIt6IoPhM3toJYtDLDL5w3n7Wp8CXRZTSSxSJofhtw=
X-Gm-Gg: ASbGncuPtTEpiAvCOs8nHTkBibRZPuTjJIzNgDObSsUAkPVKxn+alaonDxYDQx6Brsx
 R2wWAHnAfJSuD8pXSrKeMgNV78XROR1N+2UOR4gph9qGgQtFjT418dqR7EeamcLhcnREZqQEjT9
 jbX23qZYJumUKBtOcghwFfV3LJkJCtuS50HRWNUepkCCiitIBBMaQLcqEpblyNPBPn1nma/EUUx
 wImInictNzO+v+nw9k7Re92Z/VxfD39meEPbeK3LqI+6QGhFa0tvT3G6r2TvVzKgnMGofPP2a7q
 EiHzzkMjYCVinCiRZ8vF4O/nbAoNRL71RyUM99/LUDwi/h8mydUHAMi+PT23Bg8WhwCU32xo+Ln
 XasgPBxQQ13jVgNL3SoiWxVOTyuxYw+lqMgU=
X-Received: by 2002:a17:90b:388a:b0:332:3ffe:4be5 with SMTP id
 98e67ed59e1d1-33b513ae791mr16920112a91.7.1760441153632; 
 Tue, 14 Oct 2025 04:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlyXxDUchBxkJ8hKzcSdS8zUzwWZdwgzzM7euiuaBwsEcgugKDNWgcZSO4YiCAcVeXe1f/pg==
X-Received: by 2002:a17:90b:388a:b0:332:3ffe:4be5 with SMTP id
 98e67ed59e1d1-33b513ae791mr16920082a91.7.1760441153080; 
 Tue, 14 Oct 2025 04:25:53 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61b11ca9sm15658229a91.24.2025.10.14.04.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 04:25:52 -0700 (PDT)
Message-ID: <7277bc17-112b-4fc9-9099-243d216893d8@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:25:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Enable DisplayPort on QCS615
 Ride platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
 <kxwavurs7ebp5f22gxutvw4thwm24twqpahszhyxsodsikunja@7hl3y65ppqmo>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <kxwavurs7ebp5f22gxutvw4thwm24twqpahszhyxsodsikunja@7hl3y65ppqmo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfXxWMaBE16snWg
 ghGPtwrcL0GQPBIL83tNYTXiI4iyPLLpP5zNLCS07hcIiXOChDA3g5XBiO5sBwJIXtUaNJ3Crtr
 KxBNjy0467Olfvo26OVUR+PPPXT1HroLTuOq1p7j9G9iMHRoIJqP+VgYxLalLSy/y/A4L3GnDrc
 tKI9ac7MZ2ByBA4E8sFJjSPN7oEw6GaoFZlGkoq7Pra1OIGo2W9dMUYfIMOOgTVyAf64YWh4Vsb
 AAkHFWmTsLrXRoy+70ueVMXn/405/BnoNMMocuyKKNTAT9gzmQx0nsSpn0V5QgqK0KcwjuA/4dq
 68ggxnLml/vA8KAuyk2I99K0MW7Oshcp/x4wDz5YUlEDrO9g6z5Tt1UOfk7ODUgjHdpb2mtG3N5
 lPYxwpGCs0iKoDpZ6LNkvhKe4sXmzQ==
X-Proofpoint-GUID: agJRk9Q1ThL_CSEI3SPyZ5eg72KGuabk
X-Proofpoint-ORIG-GUID: agJRk9Q1ThL_CSEI3SPyZ5eg72KGuabk
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ee3342 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lUa4T_ycwPSD0wKDvOsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
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


On 10/14/2025 6:21 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 05:42:12PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Add DP connector node and configure MDSS DisplayPort controller for
>> QCS615 Ride platform. Include lane mapping and PHY supply settings
>> to support DP output.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 31 +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 9ac1dd3483b56f9d1652f8a38f62d759efa92b6a..0b8bcabdd90a0820b1f9c85e43b78e40eb8a9a38 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -39,6 +39,20 @@ xo_board_clk: xo-board-clk {
>>  		};
>>  	};
>>  
>> +	dp0-connector {
>> +		compatible = "dp-connector";
>> +		label = "DP0";
>> +		type = "mini";
>> +
>> +		hpd-gpios = <&io_expander 8 GPIO_ACTIVE_HIGH>;
> Not the gpio102/ 103 / 104? Interesting.


Yes, on this platform the DP HPD signal is controlled by the pin controller
on the video-out sub-board, not by the TLMM on the SoC.


>> +
>> +		port {
>> +			dp0_connector_in: endpoint {
>> +				remote-endpoint = <&mdss_dp0_out>;
>> +			};
>> +		};
>> +	};
>> +
>>  	dp-dsi0-connector {
>>  		compatible = "dp-connector";
>>  		label = "DSI0";
>> @@ -423,6 +437,16 @@ &mdss {
>>  	status = "okay";
>>  };
>>  
>> +&mdss_dp0 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0_out {
>> +	data-lanes = <3 2 0 1>;
> It's not a board peculiarity. All QCS615 / SM6150 devices are affected
> by this twist. Please move this to the SoC DT file.


Ok.


>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
>> +	remote-endpoint = <&dp0_connector_in>;
>> +};
>> +
>>  &mdss_dsi0 {
>>  	vdda-supply = <&vreg_l11a>;
>>  	status = "okay";
>> @@ -623,6 +647,13 @@ &usb_qmpphy {
>>  	status = "okay";
>>  };
>>  
>> +&usb_qmpphy_2 {
>> +	vdda-phy-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +
>> +	status = "okay";
>> +};
>> +
>>  &usb_1 {
>>  	status = "okay";
>>  };
>>
>> -- 
>> 2.34.1
>>
>>
