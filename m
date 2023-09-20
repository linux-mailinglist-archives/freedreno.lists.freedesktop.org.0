Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 971AE7A8D0B
	for <lists+freedreno@lfdr.de>; Wed, 20 Sep 2023 21:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A9B10E544;
	Wed, 20 Sep 2023 19:46:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040E510E544
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 19:46:08 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38KJVqlE023660
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 19:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UIdlUx1ef+4sCXiZoyNYNwbFQ1cdFfSplzD75AYVxgs=;
 b=gbl5rAyj0CtcNFdFAcyjgbUctyQjuz2v1aehFpGP34yuTd654Xu+eQkitG24K2WB6m+8
 PsQgEY4zI6anb9u+cMyxWivJt8T8SODdkblIyKg5fjK46/QvWsBs2lUBQmpTz3pTYuf0
 l2mwHsWOwdbYrCXTtjRm5LAXBDL66RhGzDA3F7psV+kqBAAB7BAj9s4cVUOiSnoFLGlW
 ePsTt02hJo3Uc8+6yzdEGQl0v2n2xXwmvblY8kgtX12ovQ1UipYPd038hIvPW7VkiAS2
 zA04PI3bBUv3WBasRzCWoLL5C01UTlZEvZ2reuNXi+UkM/VG8CDmwSaxPCXBsVVZTa+W Tg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t7vbksnjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 19:46:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38KJk63b002609
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 19:46:06 GMT
Received: from [10.110.124.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 20 Sep
 2023 12:46:06 -0700
Message-ID: <28943f4b-8cab-634f-4fbd-c66112f70a1e@quicinc.com>
Date: Wed, 20 Sep 2023 12:45:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: <freedreno@lists.freedesktop.org>
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-4-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprG8HuhDHV9k5_4+vkejnYmwmg61isZXT7EsBCbGP0pJA@mail.gmail.com>
 <f855b3db-2754-5f66-9fc2-061a517814ef@quicinc.com>
 <CAA8EJpof+dp_d_5-oADuA7RNU7ut=TKLY5Fw12EjxaSa2S+=rg@mail.gmail.com>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpof+dp_d_5-oADuA7RNU7ut=TKLY5Fw12EjxaSa2S+=rg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: SHQAnsw4Iv1xxLcWwCdExF3yngULO8RC
X-Proofpoint-ORIG-GUID: SHQAnsw4Iv1xxLcWwCdExF3yngULO8RC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_09,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309200165
Subject: Re: [Freedreno] [PATCH v3 3/7] drm/msm/dp: use
 drm_bridge_hpd_notify() to report HPD status changes
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


On 9/19/2023 2:45 AM, Dmitry Baryshkov wrote:
> On Mon, 18 Sept 2023 at 23:16, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 9/15/2023 5:41 PM, Dmitry Baryshkov wrote:
>>> On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>> Currently DP driver use drm_helper_hpd_irq_event(), bypassing drm bridge
>>>> framework, to report HPD status changes to user space frame work.
>>>> Replace it with drm_bridge_hpd_notify() since DP driver is part of drm
>>>> bridge.
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Also see the comment below.
>>>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 20 ++------------------
>>>>    1 file changed, 2 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 18d16c7..59f9d85 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -356,26 +356,10 @@ static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
>>>>                   (dp->link->sink_count == 0);
>>>>    }
>>>>
>>>> -static void dp_display_send_hpd_event(struct msm_dp *dp_display)
>>>> -{
>>>> -       struct dp_display_private *dp;
>>>> -       struct drm_connector *connector;
>>>> -
>>>> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
>>>> -
>>>> -       connector = dp->dp_display.connector;
>>>> -       drm_helper_hpd_irq_event(connector->dev);
>>>> -}
>>>> -
>>>>    static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>>>>                                               bool hpd)
>>>>    {
>>>> -       if ((hpd && dp->dp_display.link_ready) ||
>>>> -                       (!hpd && !dp->dp_display.link_ready)) {
>>>> -               drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
>>>> -                               (hpd ? "on" : "off"));
>>>> -               return 0;
>>>> -       }
>>>> +       struct drm_bridge *bridge = dp->dp_display.bridge;
>>>>
>>>>           /* reset video pattern flag on disconnect */
>>>>           if (!hpd)
>>> Note, this part (resetting the video_test and setting of is_connected)
>>> should be moved to the dp_bridge_hpd_notify() too. Please ignore this
>>> comment if this is handled later in the series.
>> I think keep them here is better since eDP does not populate hpd_enable,
>> hpd_disable and hpd_notify at edp_bridge_ops at drm_bridge_attach().
>>
>> Keep them here will work for both eDP and DP.
> Having them here doesn't work for DP-with-external-bridges, which will
> not use dp_display_send_hpd_notification.

DP-with-external-bridges?
Are you mean hpd through gpio case which only have hpd_notify without both hpd_enable and pd_disable at dp_bridge_ops?
it will use both EV_HPD_PLUG_INT and EV_HPD_UNPLUG_INT events for plug_in and unplug respectively.
Both will end up use dp_display_send_hpd_notification().
Therefore it will works too.


>>
>>>
>>>> @@ -385,7 +369,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>>>>
>>>>           drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>>>>                           dp->dp_display.connector_type, hpd);
>>>> -       dp_display_send_hpd_event(&dp->dp_display);
>>>> +       drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
>>>>
>>>>           return 0;
>>>>    }
>>>> --
>>>> 2.7.4
>>>>
>
>
