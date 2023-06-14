Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C792A73091C
	for <lists+freedreno@lfdr.de>; Wed, 14 Jun 2023 22:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9152A10E16D;
	Wed, 14 Jun 2023 20:20:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8F010E16D
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 20:20:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35EKGdtF021329
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 20:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rpzFW+KRGawspuPAxSGFeV4dSrjkZLeSyb59pk258Ig=;
 b=ULnurGQxa9QioDT7QMXZVqyMq6kLBZ70lKlLq+up+zTRn5nJxdclZ53SL0ukTQRqBdbt
 jUFb6u98a+Y0GV+Xf+IZjPn4CY//isbrJTHnI0gj/TRUja7H5bm1RIHJeAJENfE5L8m9
 J4fJzZAzcc1vLKnHZMfr2k5ghZyNntJKIpVM9s04+zLyg2TwJofGduoc/LyY03SMWkQ1
 c/4zn85PKrNyhWpxWDv/5o1TW8g8RHpNGeY+mgnE/yV5/s0bksOzvcSCYHdmLvit1qWz
 4IHTbSPkTpB25M8yjifMhwnTkm10fpzmO2xTAE/pgjzDms8l9sL3zw48PuyqTMkyhfPN Nw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r7b819dj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 20:20:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35EKK9uG001668
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 20:20:10 GMT
Received: from [10.110.112.38] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 14 Jun
 2023 13:19:54 -0700
Message-ID: <d9f25f84-7c1f-42dc-290f-58b9efbb13ae@quicinc.com>
Date: Wed, 14 Jun 2023 13:19:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: <freedreno@lists.freedesktop.org>
References: <20230612221047.1886709-1-quic_bjorande@quicinc.com>
 <435dd068-fbf2-10cf-4f78-377e689abb2c@linaro.org>
 <20230613160720.2a6ouut5qn3cewqd@ripper>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20230613160720.2a6ouut5qn3cewqd@ripper>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: WBYGbXRilm5-rlbt2XvgvirYCr-_5UGl
X-Proofpoint-GUID: WBYGbXRilm5-rlbt2XvgvirYCr-_5UGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_14,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140179
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Configure DP INTF/PHY selector
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


On 6/13/2023 9:07 AM, Bjorn Andersson wrote:
> On Tue, Jun 13, 2023 at 01:31:40AM +0300, Dmitry Baryshkov wrote:
>> On 13/06/2023 01:10, Bjorn Andersson wrote:
>>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>
>>> Some platforms provides a mechanism for configuring the mapping between
>>> (one or two) DisplayPort intfs and their PHYs.
>>>
>>> In particular SC8180X provides this functionality, without a default
>>> configuration, resulting in no connection between its two external
>>> DisplayPort controllers and any PHYs.
>>>
>>> The change implements the logic for optionally configuring which phy
>>> each of the intfs should be connected to, provides a new entry in the
>>> DPU catalog for specifying how many intfs to configure and marks the
>>> SC8180X DPU to program 2 entries.
>>>
>>> For now the request is simply to program the mapping 1:1, any support
>>> for alternative mappings is left until the use case arrise.
>>>
>>> Note that e.g. msm-4.14 unconditionally maps intf 0 to phy 0 on all
>>> rlatforms, so perhaps this is needed in order to get DisplayPort working
>>> on some other platforms as well.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>> ---
>>>    .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  1 +
>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 ++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 23 +++++++++++++++++++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 +++++++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h      |  1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 10 ++++++++
>>>    6 files changed, 45 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> index 8ed2b263c5ea..9da952692a69 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> @@ -19,6 +19,7 @@ static const struct dpu_caps sc8180x_dpu_caps = {
>>>    	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>    	.max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>    	.max_vdeci_exp = MAX_VERT_DECIMATION,
>>> +	.num_dp_intf_sel = 2,
>>>    };
>>>    static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index ac4a9e73705c..4cb8d096d8ec 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -357,6 +357,7 @@ struct dpu_rotation_cfg {
>>>     * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
>>>     * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
>>>     * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
>>> + * @num_dp_intf_sel    number of DP intfs to configure PHY selection for
>>>     */
>>>    struct dpu_caps {
>>>    	u32 max_mixer_width;
>>> @@ -371,6 +372,7 @@ struct dpu_caps {
>>>    	u32 pixel_ram_size;
>>>    	u32 max_hdeci_exp;
>>>    	u32 max_vdeci_exp;
>>> +	u32 num_dp_intf_sel;
>>>    };
>>>    /**
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>>> index 963bdb5e0252..5afa99cb148c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>>> @@ -250,6 +250,27 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
>>>    	DPU_REG_WRITE(c, HDMI_DP_CORE_SELECT, 0x1);
>>>    }
>>> +static void dpu_hw_dp_phy_intf_sel(struct dpu_hw_mdp *mdp, unsigned int *phys,
>>> +				   unsigned int num_intfs)
>>> +{
>>> +	struct dpu_hw_blk_reg_map *c = &mdp->hw;
>>> +	unsigned int intf;
>>> +	u32 sel = 0;
>>> +
>>> +	if (!num_intfs)
>>> +		return;
>>> +
>>> +	for (intf = 0; intf < num_intfs; intf++) {
>>> +		/* Specify the PHY (1-indexed) for @intf */
>>> +		sel |= (phys[intf] + 1) << (intf * 3);
>>> +
>>> +		/* Specify the @intf (1-indexed) of targeted PHY */
>>> +		sel |= (intf + 1) << (6 + phys[intf] * 3);
>>  From what I can see, phys[intf] is const. What about defining indexed masks
>> instead?
>>
> intf is the loop variable. What am I missing?
>
>>> +	}
>>> +
>>> +	DPU_REG_WRITE(c, DP_PHY_INTF_SEL, sel);
>>> +}
>>> +
>>>    static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>>>    		unsigned long cap)
>>>    {
>>> @@ -264,6 +285,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>>>    	ops->get_safe_status = dpu_hw_get_safe_status;
>>> +	ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
>> Should this be gated for DPU < 4.0? Or 5.0?
>>
>>> +
>>>    	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
>>>    		ops->intf_audio_select = dpu_hw_intf_audio_select;
>>>    }
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
>>> index a1a9e44bed36..8446d74d59b0 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
>>> @@ -125,6 +125,14 @@ struct dpu_hw_mdp_ops {
>>>    	void (*get_safe_status)(struct dpu_hw_mdp *mdp,
>>>    			struct dpu_danger_safe_status *status);
>>> +	/**
>>> +	 * dp_phy_intf_sel - configure intf to phy mapping
>>> +	 * @mdp: mdp top context driver
>>> +	 * @phys: list of phys the @num_intfs intfs should be connected to
>>> +	 * @num_intfs: number of intfs to configure
>>> +	 */
>>> +	void (*dp_phy_intf_sel)(struct dpu_hw_mdp *mdp, unsigned int *phys,
>>> +			        unsigned int num_intfs);
>>>    	/**
>>>    	 * intf_audio_select - select the external interface for audio
>>>    	 * @mdp: mdp top context driver
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
>>> index 5acd5683d25a..6d31bdc7269c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
>>> @@ -59,6 +59,7 @@
>>>    #define MDP_WD_TIMER_4_CTL2             0x444
>>>    #define MDP_WD_TIMER_4_LOAD_VALUE       0x448
>>>    #define DCE_SEL                         0x450
>>> +#define DP_PHY_INTF_SEL                 0x460
>> MDP_DP_PHY_INTF_SEL, if you don't mind.
>>
> I don't mind.
>
>>>    #define MDP_PERIPH_TOP0			MDP_WD_TIMER_0_CTL
>>>    #define MDP_PERIPH_TOP0_END		CLK_CTRL3
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index aa8499de1b9f..5dbe5d164c01 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1011,6 +1011,14 @@ unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
>>>    	return clk_get_rate(clk);
>>>    }
>>> +static void dpu_kms_dp_phy_intf_sel(struct dpu_kms *dpu_kms)
>>> +{
>>> +	const unsigned int num_intfs = dpu_kms->catalog->caps->num_dp_intf_sel;
>>> +	static unsigned int phy_map[] = {0, 1, 2};
>> Please move this to dp_phy_intf_sel() and make it const.
>>
> There's a possible use case for passing a phy_map of {0, 2} or {2, 1} on
> SC8180X. While this is left to someone in the future to have that use
> case, as split dp_phy_intf_sel() would handle such variations.
>
> That said, per the layout of the DP_PHY_INTF_SEL, num_intfs can not be
> more than 2, so this list shouldn't have 3 elements.
>
> Regards,
> Bjorn

MDP_DP_PHY_INTF_SEL is used to mapping dp controller to phy,

two controller : DP0 and DP1
three Phys: DP/USB type-C, DP/USB type-C and dp phy.

enum phy_index dp_map_to_pyhy[2]; /* map dp controller to phy */

maybe define a dp_map_to_phy[2] (above) to struct dpu_caps for every catalog will work more flexibly.





>>> +
>>> +	dpu_kms->hw_mdp->ops.dp_phy_intf_sel(dpu_kms->hw_mdp, phy_map, num_intfs);
>>> +}
>>> +
>>>    static int dpu_kms_hw_init(struct msm_kms *kms)
>>>    {
>>>    	struct dpu_kms *dpu_kms;
>>> @@ -1122,6 +1130,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>    		goto perf_err;
>>>    	}
>>> +	dpu_kms_dp_phy_intf_sel(dpu_kms);
>>> +
>>>    	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
>>>    	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
>>>    		rc = PTR_ERR(dpu_kms->hw_intr);
>> -- 
>> With best wishes
>> Dmitry
>>
