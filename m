Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AA8B90216
	for <lists+freedreno@lfdr.de>; Mon, 22 Sep 2025 12:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F52C10E412;
	Mon, 22 Sep 2025 10:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaREty9V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B2C10E412
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 10:39:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M905jT023755
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 10:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S/sA8nAMeAFMELZqIPjuLjJ4XtaKTMC4EnJ3WDadUqo=; b=kaREty9VXGeciDLI
 tCvv1KCyLhUfKm/djj2m4hnm9nMrsHRkwQzZgWImpLtgW00/4d39/gq+ziey5ral
 QSHeBxAucErWvK23cbWyWyvXCLMWdjufjUHvB0bGfHWcY2QaLk6QCTi3ReNYrTiR
 DJkmfa100TLfOC5xs5R+m3qOmLXAg6RfKqWRo3LlUGS3Q8ixL6C4tdba4NLLFS4v
 0yffZl8J5fGt178CwkdUL2tJpUwed5Y+/wAuOWw2sDaS+lrtPHx0tZuum52E3MIQ
 S8ih2sgoJweK4CzFWVrznjiSBOOB/l60gbOu2vx5X2mUhz286H1xsFLitauhQMg5
 2AMvNw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7svj4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 10:39:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b522934761fso422893a12.2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 03:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758537596; x=1759142396;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S/sA8nAMeAFMELZqIPjuLjJ4XtaKTMC4EnJ3WDadUqo=;
 b=spuRzQWQt+KA+jqWhURETHwTa1THiDwdwEQauNfkLOBhtVScSFm9wVgZct7K1CSzAd
 KA2mdu9okqLbSRalUTmjDHtFkjFlKBc5lGcQZ/7YxY3xjjg5l2UXMI4vInEqQ7eX3bcK
 LWoHwwoX5amGyT3ssgOgbTxsZi7mhJQaduBS2y3dNUrldexleSkwdNrL6LxP7Pmi69Cl
 T3xKrL3IlFJmGMIDB2rjE+82RYWK0tz0kqV1nljX1A2NhRCfsrm7iNwAehkai8VPJQ0F
 byjdtknhXK+7tpLmqOdRbB8c1jfu8xnWgBx/bhUBmoTBChmBfx65oR7T4E2OXyGvAM9P
 3RBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi3eV6MQaI2bjo+vfI1YBCZJv3RIaW+Kdd3icmLqKcw+ak1xrwii66iwt0/1bwzefaSK/D0S3xlNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSuReT3G6HvFgN7ACfBGTt9sYhyb6QoBMsjPiHzx/Ub+ppRAkN
 ZFT8CeTpXZG6gAsVoO4WuRrhqDY3DY73T9Q/vt+CzZ7i5ViCT3thVAa+veNAxPscgFkS9+75/E+
 yd+X+HfScWEwIPHxLJ8bxEVh4UtvlKy+bAsjk+up5BqeL1fQAuTpNRY1wozoctOEHT+wbViw=
X-Gm-Gg: ASbGncthu4Og2KgpfzKMS3qzskwTFH5M1tPx01pWJJJswrUGitPuWxkcSbG7KZkdzep
 Q4+hd8ml8eRfLXufEmxBP5oX0FswkGaRdk4hnfOdqvzb8Lrca1i3bzuR2TkbOZ8Fk0R9GXyr9Yw
 OZhGKOQOm1bfbo4nsDy/4svpJ097vus7VIiVPb1NfGTBpjhDu3f6PZBBqlc55mj08VeCNIo2zHi
 1fjTWCogvtvgBJQqKS0Cx99n0AnNQGATdh4KBz34BK7JlNqBS980ZudHem6a8bCl9NGMLPuIHZp
 puIEl6S0HajzCmx/ZgcVC9knItZI1q/+VmrxUWcEMh1gtZ1gqJkm4SxaFDpG4yXwfA==
X-Received: by 2002:a05:6a00:1894:b0:77f:1a6a:e72b with SMTP id
 d2e1a72fcca58-77f3126ad87mr2512344b3a.5.1758537595663; 
 Mon, 22 Sep 2025 03:39:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzeuarlsbMfcKnTGM+3OHSIOvq4mUD5eYqtObyzudC9HyNv9RqGfR6ipfD9BvwEsV1pOsHsw==
X-Received: by 2002:a05:6a00:1894:b0:77f:1a6a:e72b with SMTP id
 d2e1a72fcca58-77f3126ad87mr2512307b3a.5.1758537595213; 
 Mon, 22 Sep 2025 03:39:55 -0700 (PDT)
Received: from [10.64.16.135] ([114.94.8.21]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2473d0sm12066251b3a.27.2025.09.22.03.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 03:39:54 -0700 (PDT)
Message-ID: <bf823249-18e3-48af-a291-63b89bf83163@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 18:39:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
 <z6x3bwb7izywozeran5aq64uw4tiwlbwx4kekoy3vv3vt7qyip@2ibiat5focw2>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <z6x3bwb7izywozeran5aq64uw4tiwlbwx4kekoy3vv3vt7qyip@2ibiat5focw2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX6YJ6dM1L5W7R
 6QJ1cT6JTcf7gc/WxEy6hm2BU0tN/S/dzfoKY5ADmqNlnmIkbkaDxNV+HQG4NsR+pnes+yB48iY
 gEBI7K4vKGcVDlPgR+7mmJ9JOZpXCSFEvY0VYapRkOuzp+esY0+kKd2Dh3uoYdLGQrLcfOT4KTQ
 9OIA2RbOIy6XA3rfeu3yLzMOtyXwZggSAjVojsKRKzL9KJMAdOSbclSgP+TLLYYywRiRC/Bevua
 S0gJ2QKnFDnSoJ0ODHqAWBZks42Xx7/c3icG7z45+nx3SXZ9Ir4PmdhP/tZaOpB2eMITws+q/1v
 FFVBuucQxqo3IfGwFwdDmKfcWV+1vBMBOdiq9gMkEQzE+p6YMGB3b7a7J9DFvW7dkhhUyG5d+JL
 X3vamLGb
X-Proofpoint-ORIG-GUID: -icohvviJ_wi3_QFd7LndTKX3bt3EktK
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68d1277c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=kiRbvkIhkhXhhATYQ8oA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: -icohvviJ_wi3_QFd7LndTKX3bt3EktK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
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


On 9/22/2025 5:39 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
>> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
>> path on the old hardcoded list; non-legacy path uses cfg->reset_list.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index 3b48c69f9c3cb7daec495ebc281b83fe34e56881..3d228db9ef0882eb76e7ab9e82f8122fa9cfe314 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -335,7 +335,8 @@ struct qmp_phy_cfg {
>>  	int (*configure_dp_phy)(struct qmp_usbc *qmp);
>>  	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
>>  
>> -	/* regulators to be requested */
>> +	const char * const *reset_list;
>> +	int num_resets;
>>  	const struct regulator_bulk_data *vreg_list;
>>  	int num_vregs;
>>  
>> @@ -428,6 +429,10 @@ static const char * const usb3phy_reset_l[] = {
>>  	"phy_phy", "phy",
>>  };
>>  
>> +static const char * const usb3dpphy_reset_l[] = {
>> +	"phy_phy", "dp_phy",
>> +};
> This is unused in this patch. It should go to the patch adding QCS615 DP
> PHY compatible and the rest of the config data.


Ok, will move in next patch.


>> +
>>  static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
>>  	{ .supply = "vdda-phy", .init_load_uA = 68600 },
>>  	{ .supply = "vdda-pll", .init_load_uA = 14200 },
>> @@ -464,6 +469,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
>>  	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
>>  	.pcs_tbl                = msm8998_usb3_pcs_tbl,
>>  	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
>> +	.reset_list		= usb3phy_reset_l,
>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>  	.vreg_list              = qmp_phy_msm8998_vreg_l,
>>  	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
>>  	.regs                   = qmp_v3_usb3phy_regs_layout,
>> @@ -480,6 +487,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
>>  	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
>>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
>> +	.reset_list		= usb3phy_reset_l,
>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>  	.vreg_list		= qmp_phy_sm2290_vreg_l,
>>  	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>> @@ -496,6 +505,8 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
>>  	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
>>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
>> +	.reset_list		= usb3phy_reset_l,
>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>  	.vreg_list		= qmp_phy_msm8998_vreg_l,
>>  	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>> @@ -512,6 +523,8 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
>>  	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
>>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
>> +	.reset_list		= usb3phy_reset_l,
>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>  	.vreg_list		= qmp_phy_qcs615_vreg_l,
>>  	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>> @@ -1051,8 +1064,7 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
>>  				     "failed to get pipe clock\n");
>>  	}
>>  
>> -	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
>> -				 ARRAY_SIZE(usb3phy_reset_l));
>> +	ret = qmp_usbc_reset_init(qmp, cfg->reset_list, cfg->num_resets);
>>  	if (ret)
>>  		return ret;
>>  
>>
>> -- 
>> 2.34.1
>>
