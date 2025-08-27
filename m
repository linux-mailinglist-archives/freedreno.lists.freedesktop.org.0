Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0559B383AE
	for <lists+freedreno@lfdr.de>; Wed, 27 Aug 2025 15:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F0410E7FE;
	Wed, 27 Aug 2025 13:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgrrppWR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2268D10E817
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 13:28:14 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kE0s022920
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 13:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b6quTpF8lR620w9+wcbq204uyppZxMXlERbN+86W1g4=; b=TgrrppWRbNdt4yIr
 PXxE70i+ZxYtPJOJn0k7NJseMjEcTHHnvG4VFYfYb8MJhenupHgGqcItJRNqDHP2
 1B90YawHW2BEetJAEIF148Ws2qx3CllLpYFMhb/gcX+wGnosSSE0nhCecZgaTBZm
 ORCVOAac64Cw7hC6SHURHvTANJeSDiRDW4nyFZfhiVyPBi7ObQk+484eGD7vqWzW
 hMk74uVXrfAQ4z5HB0s1dWNVKv8Plp56NDz9Mp1ctEIlRKK9eS9/Fv6AjHoi45bQ
 m4pFkFIbxOK1nIruG9yDZAoI1rtuvcv2/u/B84xrNrDIYQxHVqY+cZr9FPqTS+6S
 iWQsTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5mj5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 13:28:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-248c171ad6aso286235ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 06:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756301292; x=1756906092;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=b6quTpF8lR620w9+wcbq204uyppZxMXlERbN+86W1g4=;
 b=Ote2AyVovOTVninmbmHk/Of/1rRXyPXDudeidMgeC64efabzDfWtrRygMezyswqh1+
 iWyAMpOV7MbGv1lgM+CG6UU0Q0YJXGoULuF2knm/tWn2P8yq4lva/5QAA+ls4oKRmnL8
 umuCxjqkVnjed+bjjrcvkk0Bl3UuWVCv0h5xaZCrHHntrrAEk3qssDzBmkZbu/HZ6r1/
 bcPh2TeNb2ULiHLWeDlaSls9ffDtLEJaK/9S8ZWEeL98BBClmzRsjm5IGy+JasRQpjwk
 1wC8UCXRboJo6TxhId9zeX5vuFbERhum8/qCPq4PHIiuXQC25MnxrDg4sZWBGWTQLssc
 GUKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS/sv5Ke0YX7TffghFpLX6VRVDX/KYkWyf4yMQnBJ3u9PwNdvMD8SREyMWtUgLxIuWN0UpRbTs5PY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWVoRJiLA0INrlLpViQ02717FSLYb9rjluFSRaqg8vEA5996ll
 XXMtSf3SnpOd630T+ptrFDxX3kBeCiDS5WSKZWwDn29D+LI/gDtboiUkMcydRMmT/Vg7HCtv23Q
 X3Nj5wfpgf5sdtSWOYuavWiCtrtR1UuRpC5xsSgjeRxJyT1X2MlSH0kgntDDwvcmqcxNCOeU=
X-Gm-Gg: ASbGncs266OQmtgSJcuQej6EqUX/+z0AzhO2oSQ0bX5qRcTaFOZzG0SC0/53cILTDsS
 9t5c2cXPQSTwjgYMH+nog9SbvXt2Q+K+nDqyNee3T8CExYwggzLaa/sOCiBSxSWf9dd5Z6SSzgd
 nIEdFaJuyeGWvDXlCJO92CgN+241XS7oNqvacV4uqR0/1FkGSyIPZLZJfupG6SKZQMfC7OzZCzW
 EvBjWxySEwmTsLwTcAx+Jw/OZep6zLf0g0+pkEcKtcsbf5zm8WjpjDqardRtKQTk7l+l8gPyk/L
 mNg/RQSLXQPQCoqJtDMqM3VknzAfk190C7h03g/2wYCP/Onv1cTuXsvPSS9ZvtbBEAMemOthqPa
 sDrZIq9vc+e6cLtL2lZvBf6fLmnDU4A==
X-Received: by 2002:a17:902:da8b:b0:246:b41d:252e with SMTP id
 d9443c01a7336-246b42c6bbamr98937405ad.2.1756301291560; 
 Wed, 27 Aug 2025 06:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGA6gBgzbMmU5Z3ZUIL62xQWLNNWghkywPFsB5di/g623cSVN2BoKy0/7fsAZ0g2TCIv6pig==
X-Received: by 2002:a17:902:da8b:b0:246:b41d:252e with SMTP id
 d9443c01a7336-246b42c6bbamr98936845ad.2.1756301290930; 
 Wed, 27 Aug 2025 06:28:10 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-248a2677f81sm14018735ad.149.2025.08.27.06.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 06:28:10 -0700 (PDT)
Message-ID: <f3cc06c1-25d2-40f4-bd77-8a9c51b40efa@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 21:28:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] phy: qcom: qmp-usbc: Move reset and regulator
 config into PHY cfg
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-7-a43bd25ec39c@oss.qualcomm.com>
 <ofvzduf5xyip7w6yde2xwsrvv3tdh7ew3yyzeya2qzpqty3j7p@bnetyjowhdn5>
 <6f7c3962-ccfc-4400-a77f-399b06da93e1@oss.qualcomm.com>
 <llrt3xnd5gagovnmyzqebp2da5v67bkxjntfcgc5r5auamspyj@7v5taph3i3c4>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <llrt3xnd5gagovnmyzqebp2da5v67bkxjntfcgc5r5auamspyj@7v5taph3i3c4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX9e17pe4DykkU
 6SFssb1+Y6phs20ruHfNQZa5spBUDT6XBK+h4gVnqeO6NLveT+1PS+vjPh1Y20p2aZxYDayfxxk
 jGMv/xFyLwBMUFL/EK75uaEDZkYt9ZzKvBPp9PMOEv6yKcVTSqN4HiEixIgQm0w77vd57Nd/tSK
 m8NDIYANe6pumkVnLGx7we2KTePX1KUdIBowJmQM/Oqhu7X2RwpEQdzQsSBQt51Iq+YUt0pzPmF
 a8pCekQAkM02bEL6J/AMVaa3kmKRvwY63ewQUhJppU4tYbsWWx7bBa4VGZjiwRCwlKx1P/Pofp6
 ySEUNiuYoeyhX5V+JUaLhJqeEzSdHIg7t6om2zsrAaMUR7pOqDk2YVdQaKafC1IlgtOZhSMlRzj
 NI+wvv4L
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68af07ed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=snPlLZzmUMwuVAg1AH4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: d2Bc8LmBJDqOP9gvOa0tuT-PCVbz40L8
X-Proofpoint-ORIG-GUID: d2Bc8LmBJDqOP9gvOa0tuT-PCVbz40L8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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


On 8/22/2025 6:08 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 22, 2025 at 04:29:28PM +0800, Xiangxu Yin wrote:
>> On 8/20/2025 7:30 PM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 20, 2025 at 05:34:49PM +0800, Xiangxu Yin wrote:
>>>> Refactor reset and regulator configuration to be managed via qmp_phy_cfg
>>>> instead of hardcoded lists. This enables per-PHY customization and
>>>> simplifies initialization logic for USB-only and USB/DP switchable PHYs.
>>> Please split into two patches in order to simplify reviewing.
>>
>> Ok, will split reset and regulator part.
>>
>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 108 +++++++++++++++----------------
>>>>  1 file changed, 53 insertions(+), 55 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> index 61128d606238321d1b573655b3b987226aa2d594..4e797b7e65da0e3a827efa9a179f1c150c1b8b00 100644
>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> @@ -421,8 +421,9 @@ struct qmp_phy_cfg {
>>>>  	int (*configure_dp_phy)(struct qmp_usbc *qmp);
>>>>  	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
>>>>  
>>>> -	/* regulators to be requested */
>>>> -	const char * const *vreg_list;
>>>> +	const char * const *reset_list;
>>>> +	int num_resets;
>>>> +	const struct regulator_bulk_data *vreg_list;
>>>>  	int num_vregs;
>>>>  
>>>>  	/* array of registers with different offsets */
>>>> @@ -453,7 +454,6 @@ struct qmp_usbc {
>>>>  	struct clk_hw dp_pixel_hw;
>>>>  	struct clk_bulk_data *clks;
>>>>  	int num_clks;
>>>> -	int num_resets;
>>>>  	struct reset_control_bulk_data *resets;
>>>>  	struct regulator_bulk_data *vregs;
>>>>  
>>>> @@ -514,9 +514,18 @@ static const char * const usb3phy_reset_l[] = {
>>>>  	"phy_phy", "phy",
>>>>  };
>>>>  
>>>> -/* list of regulators */
>>>> -static const char * const qmp_phy_vreg_l[] = {
>>>> -	"vdda-phy", "vdda-pll",
>>>> +static const char * const usb3dpphy_reset_l[] = {
>>>> +	"phy_phy", "dp_phy",
>>>> +};
>>>> +
>>>> +static const struct regulator_bulk_data qmp_phy_usb_vreg_l[] = {
>>>> +	{ .supply = "vdda-phy" },
>>>> +	{ .supply = "vdda-pll" },
>>> Please fill in the values for all platforms. It well might be that they
>>> all share the same current requirements.
>>
>> I checked previous DP projects and found all platforms configured vdda-phy with 21.8mA and vdda-pll with 36mA.
> No. On SDM660 and MSM8998 DP defines 73.4 mA for 0.9V supply and
> 12.560 mA for 1.8 V supply.
>
>> However, I didn’t find USB load configs in downstream and from SoC related power grids:
> Please check the actual HW documentation for those platforms.
>
>> QCS615
>> L12A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
>> L5A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
>>
>> sm6150
>> L11A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
>> L4A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
>>
>> SM6115
>> L12A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
>> L4A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
>>
>> QCM2290
>> L13A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
>> L12A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
>>
>> sdm660
>> LDO10A: VDDA_USB_SS_1P8 Ipk:14mA
>> LDO1B: VDDA_USB_SS_CORE Ipk:68.6mA
>>
>> msm8998
>> L2A: VDDA_USB_SS_1P2 Ipk:14.2mA
>> L1A: VDDA_USB_SS_CORE Ipk:68.6mA
>>
>> It seems the USB power requirements vary across platforms, and the
>> 21800 µA load for vdda-phy exceeds the Ipk range in most cases.
> Ipk being ?


IPK: Instantaneous Peak Current


>> I also tested removing the load settings for USB+DP PHY, and DP still works fine.
> It mostly works either because we don't allow mode switching on older
> platforms (yet) or because somebody else has already voted and that vote
> keeps the required mode.
>
> As you've started looking on specifying proper current load, please
> finish the work.


Discussed with chip validation and power SW teams.

The power grid tables are primarily used to ensure each module receives 
the correct voltage, and they define the Ipk for each submodule. 

While they don’t specify recommended regulator load values, the Ipk values
reflect the expected power domain strength and can help estimate the voting
strength needed for each supply.

Since regulator load is mainly used for voting, I’ll define init_load_uA in
the next patch based on each SoC’s Ipk values to better align with hardware expectations.


>> So, can we keep the regulator config as original qmp_phy_vreg_l?
>> static const char * const qmp_phy_vreg_l[] = { "vdda-phy", "vdda-pll"} 
>>
>>
>>>> +};
>>>> +
>>>> +static const struct regulator_bulk_data qmp_phy_usbdp_vreg_l[] = {
>>>> +	{ .supply = "vdda-phy", .init_load_uA = 21800 },
>>>> +	{ .supply = "vdda-phy", .init_load_uA = 36000 },
>>> Typo
>>
>> Sorry for Typo, will fix in next patch.
>>
>>
>>>>  };
>>>>  
>>>>  static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
>>>> @@ -569,8 +578,10 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
>>>>  	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
>>>>  	.pcs_tbl                = msm8998_usb3_pcs_tbl,
>>>>  	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
>>>> -	.vreg_list              = qmp_phy_vreg_l,
>>>> -	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>>>> +	.reset_list		= usb3phy_reset_l,
>>>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>>> +	.vreg_list              = qmp_phy_usb_vreg_l,
>>>> +	.num_vregs              = ARRAY_SIZE(qmp_phy_usb_vreg_l),
>>>>  	.regs                   = qmp_v3_usb3phy_regs_layout,
>>>>  };
>>>>  
>>>> @@ -586,8 +597,10 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
>>>>  	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
>>>>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>>>>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
>>>> -	.vreg_list		= qmp_phy_vreg_l,
>>>> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
>>>> +	.reset_list		= usb3phy_reset_l,
>>>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>>> +	.vreg_list		= qmp_phy_usb_vreg_l,
>>>> +	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
>>>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>>>>  };
>>>>  
>>>> @@ -603,8 +616,10 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
>>>>  	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
>>>>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>>>>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
>>>> -	.vreg_list		= qmp_phy_vreg_l,
>>>> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
>>>> +	.reset_list		= usb3phy_reset_l,
>>>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>>> +	.vreg_list		= qmp_phy_usb_vreg_l,
>>>> +	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
>>>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>>>>  };
>>>>  
>>>> @@ -637,6 +652,11 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
>>>>  
>>>>  	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
>>>>  	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
>>>> +
>>>> +	.reset_list		= usb3dpphy_reset_l,
>>>> +	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
>>>> +	.vreg_list		= qmp_phy_usbdp_vreg_l,
>>>> +	.num_vregs		= ARRAY_SIZE(qmp_phy_usbdp_vreg_l),
>>>>  };
>>>>  
>>>>  static int qmp_usbc_com_init(struct phy *phy)
>>>> @@ -653,13 +673,13 @@ static int qmp_usbc_com_init(struct phy *phy)
>>>>  		return ret;
>>>>  	}
>>>>  
>>>> -	ret = reset_control_bulk_assert(qmp->num_resets, qmp->resets);
>>>> +	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>>>>  	if (ret) {
>>>>  		dev_err(qmp->dev, "reset assert failed\n");
>>>>  		goto err_disable_regulators;
>>>>  	}
>>>>  
>>>> -	ret = reset_control_bulk_deassert(qmp->num_resets, qmp->resets);
>>>> +	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
>>>>  	if (ret) {
>>>>  		dev_err(qmp->dev, "reset deassert failed\n");
>>>>  		goto err_disable_regulators;
>>>> @@ -682,7 +702,7 @@ static int qmp_usbc_com_init(struct phy *phy)
>>>>  	return 0;
>>>>  
>>>>  err_assert_reset:
>>>> -	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
>>>> +	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>>>>  err_disable_regulators:
>>>>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>>>  
>>>> @@ -694,7 +714,7 @@ static int qmp_usbc_com_exit(struct phy *phy)
>>>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>>>>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>>  
>>>> -	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
>>>> +	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>>>>  
>>>>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>>>>  
>>>> @@ -921,42 +941,22 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
>>>>  			   qmp_usbc_runtime_resume, NULL)
>>>>  };
>>>>  
>>>> -static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
>>>> +static int qmp_usbc_reset_init(struct qmp_usbc *qmp)
>>>>  {
>>>>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>> -	struct device *dev = qmp->dev;
>>>> -	int num = cfg->num_vregs;
>>>> -	int i;
>>>> -
>>>> -	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
>>>> -	if (!qmp->vregs)
>>>> -		return -ENOMEM;
>>>> -
>>>> -	for (i = 0; i < num; i++)
>>>> -		qmp->vregs[i].supply = cfg->vreg_list[i];
>>>> -
>>>> -	return devm_regulator_bulk_get(dev, num, qmp->vregs);
>>>> -}
>>>> -
>>>> -static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
>>>> -			      const char *const *reset_list,
>>>> -			      int num_resets)
>>>> -{
>>>>  	struct device *dev = qmp->dev;
>>>>  	int i;
>>>>  	int ret;
>>>>  
>>>> -	qmp->resets = devm_kcalloc(dev, num_resets,
>>>> +	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
>>>>  				   sizeof(*qmp->resets), GFP_KERNEL);
>>>>  	if (!qmp->resets)
>>>>  		return -ENOMEM;
>>>>  
>>>> -	for (i = 0; i < num_resets; i++)
>>>> -		qmp->resets[i].id = reset_list[i];
>>>> +	for (i = 0; i < cfg->num_resets; i++)
>>>> +		qmp->resets[i].id = cfg->reset_list[i];
>>>>  
>>>> -	qmp->num_resets = num_resets;
>>>> -
>>>> -	ret = devm_reset_control_bulk_get_exclusive(dev, num_resets, qmp->resets);
>>>> +	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
>>>>  	if (ret)
>>>>  		return dev_err_probe(dev, ret, "failed to get resets\n");
>>>>  
>>>> @@ -1146,11 +1146,6 @@ static int qmp_usbc_parse_usb_dt_legacy(struct qmp_usbc *qmp, struct device_node
>>>>  
>>>>  	qmp->num_clks = ret;
>>>>  
>>>> -	ret = qmp_usbc_reset_init(qmp, usb3phy_legacy_reset_l,
>>>> -				 ARRAY_SIZE(usb3phy_legacy_reset_l));
>>>> -	if (ret)
>>>> -		return ret;
>>>> -
>>>>  	return 0;
>>>>  }
>>>>  
>>>> @@ -1187,14 +1182,9 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
>>>>  	qmp->pipe_clk = devm_clk_get(dev, "pipe");
>>>>  	if (IS_ERR(qmp->pipe_clk)) {
>>>>  		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
>>>> -				     "failed to get pipe clock\n");
>>>> +					"failed to get pipe clock\n");
>>> unrelated
>>
>> Ack.
>>
>>
>>>>  	}
>>>>  
>>>> -	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
>>>> -				 ARRAY_SIZE(usb3phy_reset_l));
>>>> -	if (ret)
>>>> -		return ret;
>>>> -
>>>>  	return 0;
>>>>  }
>>>>  
>>>> @@ -1228,6 +1218,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>>>  	struct phy_provider *phy_provider;
>>>>  	struct device_node *np;
>>>>  	struct qmp_usbc *qmp;
>>>> +	const struct qmp_phy_cfg *cfg;
>>>>  	int ret;
>>>>  
>>>>  	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
>>>> @@ -1239,13 +1230,20 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>>>  
>>>>  	qmp->orientation = TYPEC_ORIENTATION_NORMAL;
>>>>  
>>>> -	qmp->cfg = of_device_get_match_data(dev);
>>>> -	if (!qmp->cfg)
>>>> +	cfg = of_device_get_match_data(dev);
>>>> +	if (!cfg)
>>>>  		return -EINVAL;
>>>>  
>>>> +	qmp->cfg = cfg;
>>> Why? This doesn't seem related at all.
>>
>> I added the |cfg| variable to simplify access to |num_vregs| and |vreg_list| in the following lines, 
>>
>> avoiding repeated |qmp->cfg->...| usage. 
>>
>> If this is considered unrelated, I’ll remove it in the next version.
> This all gets clogged in a mixture of regulator and reset changes.
> Hopefully it will be more obvious with the patches being split.
>
>>
>>>> +
>>>>  	mutex_init(&qmp->phy_mutex);
>>>>  
>>>> -	ret = qmp_usbc_vreg_init(qmp);
>>>> +	ret = qmp_usbc_reset_init(qmp);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = devm_regulator_bulk_get_const(qmp->dev, cfg->num_vregs,
>>>> +					 cfg->vreg_list, &qmp->vregs);
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
