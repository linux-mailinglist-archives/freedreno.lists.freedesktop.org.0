Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A69B3912D
	for <lists+freedreno@lfdr.de>; Thu, 28 Aug 2025 03:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DF210E069;
	Thu, 28 Aug 2025 01:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZcKznnE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265C010E048
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 01:41:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGGvCN029277
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 01:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ssoc0exiUKYkJTufSStqPOkqj7hxlg71SdT94NhDD5U=; b=KZcKznnEPFgJsOQn
 EbH6lO2kFL1smweAQwe0gt/nnQ022nK0GbWupThfJsU0f7ZLhDq/kYXGcn3hQK6z
 jX97ca+qt3gJQggKBuMYHUP/FiOEXKPGTqGziyUX6+JNDP1Eoo6Owcclv5gzhYoJ
 JikNeSV0C2Ia87AyLHicMHs4LvwtmwLWKtgSze6A3LvFyVFO2VvH8ywTGn6pfbez
 Qi99DmkrLD2WCiXWCqUtboc3ClyzpFsHi1/n0hlX2+o877h3lvJGweYxtx+HXv8u
 FCsMEfO5EAMC6yX95wiRWKiTapGow2J82CzabkJAb8TSNvn3l3queQl6F0YBuk7+
 xULbmA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umemnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 01:41:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-244581a191bso849095ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 18:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756345264; x=1756950064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ssoc0exiUKYkJTufSStqPOkqj7hxlg71SdT94NhDD5U=;
 b=wLeLqDsaw9AUDArbRHyrABCrFdLm5aUv3Voy2ynLtQpqHa/0p2ZWWR3/JohEi18dgc
 my0v52NFnsBCoB1K9AF5zyZMQ5tbw8rnOwLOssPzHgc4E2Of56DuTkzt3uj9D1mU8mkc
 D6MNl2T37kb02h2tfswgbvs8F4CIO9/kj+JG/JOOAGZs+ATrROfDEWNeyRHJGlECBzjl
 MKog4+Oyr63sbv6y1TLpXVrTNghwXXxhSFPiHgEclFMjIOp2SZ5P+63IoJEaywZY6avT
 GKkXzasMF0UltHr2Bh5aquqgaf/AeHpi8FfOljZiHjgYk46tZD6xRaxeVS9uwgVzFu1L
 ogNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2qA6LEVAcRMG+h9sFfZrYIfuXomHeZaKV2FdB2tus0IyeeoZ9QVdqEEbCe96wGDCQwb1l/WSVDAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzun2GREmqyu46Ql/Fj+58/w5iFnsURheXSyZh6tGIlnTLYl3YC
 eatP/jNGYh/PnGZH0y96MRBqZZ7PZF0KZUP+WfNhCOhNB20Ktv4vXQYiIXmaZ93XernInI4812X
 zuq27I1CTLjD7NeONtia2ixN4KKHKU2r8a/Aj3uJ8C3EAsdDUUVDv1el6SwspcUwTIARsEEw=
X-Gm-Gg: ASbGncsGg8ONgp3CEvU4DjDWOVAV+GzDaazG/vb7hqKqqDDrkEfd+HHu7srSXs2qc1m
 DhxaksBdLGpL/gXbIG7bDNoxRV9/e+FlJScZfZSSBTmGt4cd2IjDaL1EqmklauP3jp23CaJXh25
 Awj/zEBYIqHOgIAWRKz8Qw3MqbMaJy4bsRg5j0aJET6+Y6jR3tCWiFPv8hOOBANFftEqjurh3Q3
 MTEVWBTOu+X9vHM2mftLUp6zTrpz0O6AE76jRwVEstU8iEG6RfhnJ3DT6GDtd46A/YZLjRB5Lz+
 OD6ar6pPrChVlpXsi15yMhT++KkOGQ7mJQ6XNDml5kD78uU5A9asypOPIJpZ24SToEuckm4aaRJ
 +CmvgtT9Dv7wpXmEjtlH42MyrxtBE+g==
X-Received: by 2002:a17:902:f9c3:b0:23f:fd0e:e5c0 with SMTP id
 d9443c01a7336-2462ef98ba8mr109012275ad.9.1756345263526; 
 Wed, 27 Aug 2025 18:41:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWXipYMCUO2Kzzeeg7jT0Nmhu/2L6WMJrB3Z5gpVV1nUTBpvsLjmhXjD4WaZ1s7Er0CBjoxA==
X-Received: by 2002:a17:902:f9c3:b0:23f:fd0e:e5c0 with SMTP id
 d9443c01a7336-2462ef98ba8mr109012105ad.9.1756345262976; 
 Wed, 27 Aug 2025 18:41:02 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466889c61bsm133558605ad.143.2025.08.27.18.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 18:41:02 -0700 (PDT)
Message-ID: <749ec6d1-f2f9-40f5-9c41-3443698f250a@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 09:40:51 +0800
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
 <f3cc06c1-25d2-40f4-bd77-8a9c51b40efa@oss.qualcomm.com>
 <osav4kwxytfuxvnf26ugdw2qasd753smywsux5punuegbkxqgq@fp3r4esqiqyq>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <osav4kwxytfuxvnf26ugdw2qasd753smywsux5punuegbkxqgq@fp3r4esqiqyq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68afb3b0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Nindc6OTbrst8G9qLT4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX+iEkwjprwUc/
 ksf5ac5MXs57xOHNGBQTc9yeLZ/ScVaxDp67eug31E24QpNWbHgEircqXJD6xEqGgd/1juHMK48
 LeECJqvznexDeYg4tmK8qhzNwk2vs+pEus9Gi9YagIXcKGsdEpX05SNVPDAkDhWrl9/kHoF5sVW
 ndv4/OeJ2mO1yc2yjyphvUEvYyqbICj0r6/oTME7zg/QXeVno2lc/1Q1GwvWVH9CcOMD8NWqAtJ
 VW5lmj+s9bpDkDGmVHJs5fgqxaqxpz3xdBRNbq2Lep63wPoIXGQuLDTDXYd7QHhRUfq+r1VUQ5B
 fUtcUudaelJsID0ebFQj+r8ZjHsToJkNW1x+OW8JxsyWyfzgaUnSrWyJQ0Azc+3Q4EM9EvQuUus
 sS5INLZn
X-Proofpoint-GUID: 3e1-Hi_RNmVft7qEb9x-VAxFKTZjbwHl
X-Proofpoint-ORIG-GUID: 3e1-Hi_RNmVft7qEb9x-VAxFKTZjbwHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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


On 8/27/2025 10:31 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 27, 2025 at 09:28:00PM +0800, Xiangxu Yin wrote:
>> On 8/22/2025 6:08 PM, Dmitry Baryshkov wrote:
>>> On Fri, Aug 22, 2025 at 04:29:28PM +0800, Xiangxu Yin wrote:
>>>> On 8/20/2025 7:30 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Aug 20, 2025 at 05:34:49PM +0800, Xiangxu Yin wrote:
>>>>>> Refactor reset and regulator configuration to be managed via qmp_phy_cfg
>>>>>> instead of hardcoded lists. This enables per-PHY customization and
>>>>>> simplifies initialization logic for USB-only and USB/DP switchable PHYs.
>>>>> Please split into two patches in order to simplify reviewing.
>>>> Ok, will split reset and regulator part.
>>>>
>>>>
>>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 108 +++++++++++++++----------------
>>>>>>  1 file changed, 53 insertions(+), 55 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>>>> index 61128d606238321d1b573655b3b987226aa2d594..4e797b7e65da0e3a827efa9a179f1c150c1b8b00 100644
>>>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>>>> @@ -421,8 +421,9 @@ struct qmp_phy_cfg {
>>>>>>  	int (*configure_dp_phy)(struct qmp_usbc *qmp);
>>>>>>  	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
>>>>>>  
>>>>>> -	/* regulators to be requested */
>>>>>> -	const char * const *vreg_list;
>>>>>> +	const char * const *reset_list;
>>>>>> +	int num_resets;
>>>>>> +	const struct regulator_bulk_data *vreg_list;
>>>>>>  	int num_vregs;
>>>>>>  
>>>>>>  	/* array of registers with different offsets */
>>>>>> @@ -453,7 +454,6 @@ struct qmp_usbc {
>>>>>>  	struct clk_hw dp_pixel_hw;
>>>>>>  	struct clk_bulk_data *clks;
>>>>>>  	int num_clks;
>>>>>> -	int num_resets;
>>>>>>  	struct reset_control_bulk_data *resets;
>>>>>>  	struct regulator_bulk_data *vregs;
>>>>>>  
>>>>>> @@ -514,9 +514,18 @@ static const char * const usb3phy_reset_l[] = {
>>>>>>  	"phy_phy", "phy",
>>>>>>  };
>>>>>>  
>>>>>> -/* list of regulators */
>>>>>> -static const char * const qmp_phy_vreg_l[] = {
>>>>>> -	"vdda-phy", "vdda-pll",
>>>>>> +static const char * const usb3dpphy_reset_l[] = {
>>>>>> +	"phy_phy", "dp_phy",
>>>>>> +};
>>>>>> +
>>>>>> +static const struct regulator_bulk_data qmp_phy_usb_vreg_l[] = {
>>>>>> +	{ .supply = "vdda-phy" },
>>>>>> +	{ .supply = "vdda-pll" },
>>>>> Please fill in the values for all platforms. It well might be that they
>>>>> all share the same current requirements.
>>>> I checked previous DP projects and found all platforms configured vdda-phy with 21.8mA and vdda-pll with 36mA.
>>> No. On SDM660 and MSM8998 DP defines 73.4 mA for 0.9V supply and
>>> 12.560 mA for 1.8 V supply.
>>>
>>>> However, I didn’t find USB load configs in downstream and from SoC related power grids:
>>> Please check the actual HW documentation for those platforms.
>>>
>>>> QCS615
>>>> L12A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
>>>> L5A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
>>>>
>>>> sm6150
>>>> L11A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
>>>> L4A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
>>>>
>>>> SM6115
>>>> L12A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
>>>> L4A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
>>>>
>>>> QCM2290
>>>> L13A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
>>>> L12A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
>>>>
>>>> sdm660
>>>> LDO10A: VDDA_USB_SS_1P8 Ipk:14mA
>>>> LDO1B: VDDA_USB_SS_CORE Ipk:68.6mA
>>>>
>>>> msm8998
>>>> L2A: VDDA_USB_SS_1P2 Ipk:14.2mA
>>>> L1A: VDDA_USB_SS_CORE Ipk:68.6mA
>>>>
>>>> It seems the USB power requirements vary across platforms, and the
>>>> 21800 µA load for vdda-phy exceeds the Ipk range in most cases.
>>> Ipk being ?
>>
>> IPK: Instantaneous Peak Current
>>
>>
>>>> I also tested removing the load settings for USB+DP PHY, and DP still works fine.
>>> It mostly works either because we don't allow mode switching on older
>>> platforms (yet) or because somebody else has already voted and that vote
>>> keeps the required mode.
>>>
>>> As you've started looking on specifying proper current load, please
>>> finish the work.
>>
>> Discussed with chip validation and power SW teams.
>>
>> The power grid tables are primarily used to ensure each module receives 
>> the correct voltage, and they define the Ipk for each submodule. 
>>
>> While they don’t specify recommended regulator load values, the Ipk values
>> reflect the expected power domain strength and can help estimate the voting
>> strength needed for each supply.
>>
>> Since regulator load is mainly used for voting, I’ll define init_load_uA in
>> the next patch based on each SoC’s Ipk values to better align with hardware expectations.
> If the Ipk is defined per module, then it's fine.


Yes, under each regulator, multiple submodules are powered, and each submodule defines its own Ipk value.


