Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88745855366
	for <lists+freedreno@lfdr.de>; Wed, 14 Feb 2024 20:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0C610E2C3;
	Wed, 14 Feb 2024 19:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MmRBVlMA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7987810E2C3
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 19:44:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41EJCLPe023815
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 19:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=nLWV27RDQOK+sdDrVeXq0jsiL4l+lZ+JtXqWYS8Idzs=; b=Mm
 RBVlMAzOQuPl3dSqVxh07o4/TE6dwA5uXDhmjdq2zuwSL65Oi4jqsSm6YMwAVkCz
 szKEpBC3eJ0yajasEMHNTcJl1X6wk/bV4XjV4nSzzeBIoA1QlAArQ7UXxgEFwayg
 Un/0UqcSbpGHLPmhtxKP+6RiSCK9Eq8UdU/szajKe+frg5aTtZsdeNzpXEeFfy+T
 jpi3oAwEg2ZTqPfSGVUxvpDNryClHxzblpy5oEbOHWjBrv84rSrrxy+B+QM5EFgN
 JF4Ho3wTV28SHSjT7Mj4J1AgdZdobGDlYYhBmS/4C7JWQ1S7nJPQqIufynw1+/1K
 dD4Nkw+XlHXDX26QVCPA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8ennaj7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 19:44:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EJiiM4018612
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 19:44:44 GMT
Received: from [10.110.16.180] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 14 Feb
 2024 11:44:43 -0800
Message-ID: <9b30a35c-0dfb-64c5-e798-14d9e9979034@quicinc.com>
Date: Wed, 14 Feb 2024 11:44:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 15/19] drm/msm/dp: enable SDP and SDE periph flush
 update
To: <freedreno@lists.freedesktop.org>
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-16-quic_parellan@quicinc.com>
 <CAA8EJpp43otRsAKthEgzJPrVf0j4_0=_kRMnqBNYhEgED=wiYg@mail.gmail.com>
Content-Language: en-US
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <CAA8EJpp43otRsAKthEgzJPrVf0j4_0=_kRMnqBNYhEgED=wiYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FDJoTElGMCPBnKjGlbvqgcfMrEoOhPQf
X-Proofpoint-ORIG-GUID: FDJoTElGMCPBnKjGlbvqgcfMrEoOhPQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_12,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=666
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140154
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


On 2/14/2024 11:41 AM, Dmitry Baryshkov wrote:
> On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>> DP controller can be setup to operate in either SDP update flush mode or
>> peripheral flush mode based on the DP controller hardware version.
>>
>> Starting in DP v1.2, the hardware documents require the use of
>> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
>>
>> In-line with this guidance, lets program the DP controller to use
>> peripheral flush mode starting DP v1.2
>>
>> Changes in v3:
>>          - Clear up that the DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE
>>            macro is setting bits [24:23] to a value of 3
>>
>> Changes in v2:
>>          - Use the original dp_catalog_hw_revision() function to
>>            correctly check the DP HW version
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  5 +++++
>>   4 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> index 61d5317efe683..823eeba7e71d3 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> @@ -440,6 +440,23 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
>>          dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
>>   }
>>
>> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog)
>> +{
>> +       u32 mainlink_ctrl, hw_revision;
>> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
>> +                               struct dp_catalog_private, dp_catalog);
>> +
>> +       mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
>> +
>> +       hw_revision = dp_catalog_hw_revision(dp_catalog);
>> +       if (hw_revision >= DP_HW_VERSION_1_2)
>> +               mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
>> +       else
>> +               mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
>> +
>> +       dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>> +}
>> +
>>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>>                                          u32 rate, u32 stream_rate_khz,
>>                                          bool fixed_nvid, bool is_ycbcr_420)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> index 4bf08c27a9bf3..eb05a37837beb 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> @@ -98,6 +98,7 @@ void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
>>   void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
>>   void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
>>   void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
>> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog);
>>   void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>>                                  u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index beef86b1aaf81..f1e7b0a5ee5d1 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -170,6 +170,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>>
>>          dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>>          dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
>> +       dp_catalog_setup_peripheral_flush(ctrl->catalog);
>>
>>          dp_ctrl_config_ctrl(ctrl);
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index 2983756c125cd..d4fb8572cd1e4 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -6,6 +6,9 @@
>>   #ifndef _DP_REG_H_
>>   #define _DP_REG_H_
>>
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +
>>   /* DP_TX Registers */
>>   #define REG_DP_HW_VERSION                      (0x00000000)
>>
>> @@ -102,6 +105,8 @@
>>   #define DP_MAINLINK_CTRL_ENABLE                        (0x00000001)
>>   #define DP_MAINLINK_CTRL_RESET                 (0x00000002)
>>   #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER   (0x00000010)
>> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP      (0x00800000)
> This define covers data from the same bit field. Please use FIELD_PREP too.

Ack


>
>> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE       FIELD_PREP(GENMASK(24, 23), 3)
> #define DP_foo_MASK GENMASK(24,23)


Ack


>
>>   #define DP_MAINLINK_FB_BOUNDARY_SEL            (0x02000000)
>>
>>   #define REG_DP_STATE_CTRL                      (0x00000004)
>> --
>> 2.39.2
>>
>
