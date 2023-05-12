Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6C7701126
	for <lists+freedreno@lfdr.de>; Fri, 12 May 2023 23:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B8510E2C0;
	Fri, 12 May 2023 21:28:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BDE10E2C0
 for <freedreno@lists.freedesktop.org>; Fri, 12 May 2023 21:28:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CI2BKP002300; Fri, 12 May 2023 21:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tmlcvFZPOm7cn0EH3Ys3Fj2hW7TIEKrMrDgwpf+11Rg=;
 b=FUqELP8OIeLjJ0TVtinPG7sYeYH7nemtgEC+aqXKggThGJNQ27mCxiPiSL5CuHkm/5Lv
 N6WKNExEyF6I3uXqhvOKRRCP0He1wZ+0s0gWwsjQCUtDCSo07hEQieaPTREKX4v8VFfo
 ZygFI5LcKWYjLOKn3Yic9xZMz9lx8Phu56oIx6J0PflCUCKei/ibRavopi6DhV+c/YKO
 q9lm1OrZWRI0JFexTJNAcBbTynFS86pZHisFAc96gqqCGTiqUoZGNqhaOaTJ83Ee/1X4
 HTCd9YYBy3DM9zoqDDDhLGnPWcqlhVO+v7luy95JEADszz2XWkZc6S9G/egijLah+nU5 Qg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhj9s1mpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:28:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34CLSZlC014295
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:28:35 GMT
Received: from [10.110.82.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 12 May
 2023 14:28:34 -0700
Message-ID: <2d1fad81-c1dc-77db-de67-caf130af9767@quicinc.com>
Date: Fri, 12 May 2023 14:28:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
 <1683750665-8764-2-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprtQF0x_LCOTrt5bvRnJ+xRz6QxLF6QAP-4Pff6V5TJ2g@mail.gmail.com>
 <20230511155331.2jmfe7xcs5tihdgb@ripper>
 <5ef83699-01de-d062-6239-9bb834c70458@linaro.org>
 <8ac0b5f5-27da-2b28-8f10-b2fca447511a@quicinc.com>
 <CAA8EJpokAoGni7vNwuijs7EvmjCweO3pgChij3Qx3OUkVTVpiQ@mail.gmail.com>
 <cf8b7c38-b716-e44a-86e5-d65ba7fa2869@quicinc.com>
 <CAA8EJprN7Kp_NdBi9NHqheDdgEhj=3gyBRwr5ufTSH47P9L_-Q@mail.gmail.com>
 <0456cbfe-66bf-9cc3-16ca-a85be603af01@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <0456cbfe-66bf-9cc3-16ca-a85be603af01@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: lNQuf1ueCVdNpkWcXuZgJFGyZIn_7h9q
X-Proofpoint-GUID: lNQuf1ueCVdNpkWcXuZgJFGyZIn_7h9q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_13,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305120180
Subject: Re: [Freedreno] [PATCH v1 1/2] drm/msm/dp: enable HDP
 plugin/unplugged interrupts to hpd_enable/disable
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Bjorn and Dmitry

On 5/12/2023 12:34 PM, Kuogee Hsieh wrote:
> 
> On 5/12/2023 10:28 AM, Dmitry Baryshkov wrote:
>> On Fri, 12 May 2023 at 19:52, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>> wrote:
>>>
>>> On 5/11/2023 5:54 PM, Dmitry Baryshkov wrote:
>>>> On Fri, 12 May 2023 at 03:16, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>>>> wrote:
>>>>> On 5/11/2023 8:57 AM, Dmitry Baryshkov wrote:
>>>>>> On 11/05/2023 18:53, Bjorn Andersson wrote:
>>>>>>> On Thu, May 11, 2023 at 07:24:46AM +0300, Dmitry Baryshkov wrote:
>>>>>>>> On Wed, 10 May 2023 at 23:31, Kuogee Hsieh 
>>>>>>>> <quic_khsieh@quicinc.com>
>>>>>>>> wrote:
>>>>>>>>> The internal_hpd flag was introduced to handle external DP HPD
>>>>>>>>> derived from GPIO
>>>>>>>>> pinmuxed into DP controller. HPD plug/unplug interrupts cannot be
>>>>>>>>> enabled until
>>>>>>>>> internal_hpd flag is set to true.
>>>>>>>>> At both bootup and resume time, the DP driver will enable 
>>>>>>>>> external DP
>>>>>>>>> plugin interrupts and handle plugin interrupt accordingly.
>>>>>>>>> Unfortunately
>>>>>>>>> dp_bridge_hpd_enable() bridge ops function was called to set
>>>>>>>>> internal_hpd
>>>>>>>>> flag to true later than where DP driver expected during bootup 
>>>>>>>>> time.
>>>>>>>>>
>>>>>>>>> This causes external DP plugin event to not get detected and
>>>>>>>>> display stays blank.
>>>>>>>>> Move enabling HDP plugin/unplugged interrupts to
>>>>>>>>> dp_bridge_hpd_enable()/disable() to
>>>>>>>>> set internal_hpd to true along with enabling HPD plugin/unplugged
>>>>>>>>> interrupts
>>>>>>>>> simultaneously to avoid timing issue during bootup and resume.
>>>>>>>>>
>>>>>>>>> Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable
>>>>>>>>> callbacks")
>>>>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>>>> Thanks for debugging this!
>>>>>>>>
>>>>>>>> However after looking at the driver I think there is more than 
>>>>>>>> this.
>>>>>>>>
>>>>>>>> We have several other places gated on internal_hpd flag, where 
>>>>>>>> we do
>>>>>>>> not have a strict ordering of events.
>>>>>>>> I see that dp_hpd_plug_handle() and dp_hpd_unplug_handle() also 
>>>>>>>> toggle
>>>>>>>> DP_DP_IRQ_HPD_INT_MASK and DP_DP_HPD_REPLUG_INT_MASK depending on
>>>>>>>> internal_hpd. Can we toggle all 4 interrupts from the
>>>>>>>> hpd_enable/hpd_disable functions? If we can do it, then I think 
>>>>>>>> we can
>>>>>>>> drop the internal_hpd flag completely.
>>>>>>>>

No we cannot. The HPD logic works in a flip-flop model. When we get the 
plug interrupt, we need to flip to tell the hw to wait for unplug and 
when we get unplug, we need to tell the hw to wait for plug.

The two calls in plug_handle() / unplug_handle() are doing that whereas 
hpd_enable/hpd_disable are disabling the hpd interrupts altogether.

In other words, we cannot rely on hpd_enable() / hpd_disable() calls to 
do the flip part as that has to be done every plug/unplug. In addition 
we need to handle the compliance test cases with REPLUG.

So hpd_enable / hpd_disable is not the right place to move all these calls.

>>>>>>> Yes, that's what I believe the DRM framework intend us to do.
>>>>>>>
>>>>>>> The problem, and reason why I didn't do tat in my series, was 
>>>>>>> that in
>>>>>>> order to update the INT_MASKs you need to clock the IP-block and 
>>>>>>> that's
>>>>>>> done elsewhere.
>>>>>>>
>>>>>>> So, for the internal_hpd case, it seems appropriate to 
>>>>>>> pm_runtime_get()
>>>>>>> in hpd_enable() and unmask the HPD interrupts, and mask the 
>>>>>>> interrupts
>>>>>>> and pm_runtime_put() in hpd_disable().
>>>>>>>

I dont agree completely on this. The blocks powering the HPD block also 
power other things. So the AUX clk and host_init() both are needed for 
HPD but they power not just the HPD.

So powering all of these at hpd_enable / hpd_disable would be an 
overkill for that call and not required as well.

Before talking about removing hpd_event_thread, I think we should 
understand why its there. It handles all asynchronous connection and 
sink related events in one centralized place like 
connect/disconnect/irq_hpd.

This is a well tested code with multiple dongles on chromebooks and I 
dont see any alternative to it at the moment and dont think that 
discussion is necessary in the context of this bug fix . We can talk 
about it more in one of our sync ups if you want to know more.

Based on the responses I have seen so far, I see that we had to 
introduce the dynamic control of internal_hpd for below case :

2) DP without GPIO: Downstream drm_bridge connected, is_edp = false and
internal HPD-logic should not be used/enabled (internal_hpd = false).
Power doesn't need to be on unless hpd_notify is invoked to tell us that
there's something connected...

So we want internal_hpd to be false for this case.

That is good information and provides the context of why hpd_enable / 
hpd_disable callbacks were implemented as they are optional as per the 
framework.

I saw Bjorn mentioned that "The DRM framework will invoke hpd_enable on 
the bridge furthest out that
has OP_HPD. So in the case of HPD signal being pinmuxed into the
HPD-logic, dp_bridge_hpd_enable() will be invoked.
"

For my understanding, this logic is in the drm_bridge_connector_init() 
right? So bridge_connector->bridge_detect will hold the last bridge and 
hence enable_hpd / disable/hpd gets called only for the last one right?

If all this is correct, I think the fix posted at the moment is the best 
possible one as it correctly does what hpd_enable / hpd_disable 
callbacks are supposed to do without overdoing it.

What are the concerns with this patch with all the explanation I have 
given now.

>>>>>>>
>>>>>>> But for edp and external HPD-signal we also need to make sure 
>>>>>>> power is
>>>>>>> on while something is connected...
>>>>>> I think this is already handled by the existing code, see calls to 
>>>>>> the
>>>>>> dp_display_host_init().
>>>>>>
>>>>>>>> I went on and checked other places where it is used:
>>>>>>>> - dp_hpd_unplug_handle(), guarding DP_DP_HPD_PLUG_INT_MASK 
>>>>>>>> toggling. I
>>>>>>>> think we can drop these two calls completely. The function is under
>>>>>>>> the event_mutex protection, so other events can not interfere.
>>>>>>>> - dp_bridge_hpd_notify(). What is the point of this check? If some
>>>>>>>> other party informs us of the HPD event, we'd better handle it 
>>>>>>>> instead
>>>>>>>> of dropping it. Correct?  In other words, I'd prefer seeing the
>>>>>>>> hpd_event_thread removal. Instead of that I think that on
>>>>>>>> HPD/plug/unplug/etc. IRQ the driver should call into the drm stack,
>>>>>>>> then the hpd_notify call should process those events.
>>>>>>>>

>>>>> 1) DP with GPIO: No downstream drm_bridge are connected, is_edp = 
>>>>> false
>>>>> and internal HPD-logic is in used (internal_hpd = true). Power 
>>>>> needs to
>>>>> be on at all times etc.
>>>>>
>>>>> 2) DP without GPIO: Downstream drm_bridge connected, is_edp = false 
>>>>> and
>>>>> internal HPD-logic should not be used/enabled (internal_hpd = false).
>>>>> Power doesn't need to be on unless hpd_notify is invoked to tell us 
>>>>> that
>>>>> there's something connected...
>>>>>
>>>>> - dp_bridge_hpd_notify(). What is the point of this check? <== i have
>>>>> below two questions,
>>>>>
>>>>> 1) can you explain when/what this dp_bridge_hpd_notify() will be 
>>>>> called?
>>>> The call chain is drm_bridge_hpd_notify() ->
>>>> drm_bridge_connector_hpd_notify() -> .hpd_notify() for all drm_bridge
>>>> in chain
>>>>
>>>> One should add a call to drm_bridge_hpd_notify() when the hotplug
>>>> event has been detected.
>>>>
>>>> Also please note the patch 
>>>> https://patchwork.freedesktop.org/patch/484432/
>>>>
>>>>> 2) is dp_bridge_hpd_notify() only will be called at above case #2? and
>>>>> it will not be used by case #1?
>>>> Once the driver calls drm_bridge_hpd_notify() in the hpd path, the
>>>> hpd_notify callbacks will be called in case#1 too.
>>>>
>>>> BTW: I don't see drm_bridge_hpd_notify() or
>>>> drm_kms_{,connector_}_hotplug_event() HPD notifications in the DP
>>>> driver at all. This should be fixed.
>>> Just curious, since dp_bridge_detect() only return either
>>> connector_status_connected or connector_status_disconnect,
>>>
>>> how IRQ_HPD_INT (attention) and HPD_REPLUG_INT be generated at DP 
>>> case#1?
>> if (bridge.status == connected && status == connected) {
>>    either attention or replug were reported
>> }
>>
>> BTW: what is HPD_REPLUG_INT, if you excuse my ignorance?
> 
> HPD high -- drop to low for less than 2 ms -- go back to high again
> 
> Currently, we have to treat this scenario as HPD_UNPLUG_int followed by 
> HPD_PLUG_INT to pass compliance test
> 
>>
>>>>>
>>>>>>> I agree, that seems to be what's expected of us from the DRM 
>>>>>>> framework.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Bjorn
>>>>>>>
>>>>>>>>> ---
>>>>>>>>>     drivers/gpu/drm/msm/dp/dp_display.c | 27 
>>>>>>>>> ++++++++++++++-------------
>>>>>>>>>     1 file changed, 14 insertions(+), 13 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>>> index 3e13acdf..71aa944 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>>> @@ -1088,13 +1088,6 @@ static void dp_display_config_hpd(struct
>>>>>>>>> dp_display_private *dp)
>>>>>>>>>            dp_display_host_init(dp);
>>>>>>>>>            dp_catalog_ctrl_hpd_config(dp->catalog);
>>>>>>>>>
>>>>>>>>> -       /* Enable plug and unplug interrupts only if requested */
>>>>>>>>> -       if (dp->dp_display.internal_hpd)
>>>>>>>>> -               dp_catalog_hpd_config_intr(dp->catalog,
>>>>>>>>> -                               DP_DP_HPD_PLUG_INT_MASK |
>>>>>>>>> -                               DP_DP_HPD_UNPLUG_INT_MASK,
>>>>>>>>> -                               true);
>>>>>>>>> -
>>>>>>>>>            /* Enable interrupt first time
>>>>>>>>>             * we are leaving dp clocks on during disconnect
>>>>>>>>>             * and never disable interrupt
>>>>>>>>> @@ -1396,12 +1389,6 @@ static int dp_pm_resume(struct device *dev)
>>>>>>>>>
>>>>>>>>>            dp_catalog_ctrl_hpd_config(dp->catalog);
>>>>>>>>>
>>>>>>>>> -       if (dp->dp_display.internal_hpd)
>>>>>>>>> -               dp_catalog_hpd_config_intr(dp->catalog,
>>>>>>>>> -                               DP_DP_HPD_PLUG_INT_MASK |
>>>>>>>>> -                               DP_DP_HPD_UNPLUG_INT_MASK,
>>>>>>>>> -                               true);
>>>>>>>>> -
>>>>>>>>>            if (dp_catalog_link_is_connected(dp->catalog)) {
>>>>>>>>>                    /*
>>>>>>>>>                     * set sink to normal operation mode -- D0
>>>>>>>>> @@ -1801,15 +1788,29 @@ void dp_bridge_hpd_enable(struct 
>>>>>>>>> drm_bridge
>>>>>>>>> *bridge)
>>>>>>>>>     {
>>>>>>>>>            struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>>>>>>>>>            struct msm_dp *dp_display = dp_bridge->dp_display;
>>>>>>>>> +       struct dp_display_private *dp;
>>>>>>>>> +
>>>>>>>>> +       dp = container_of(dp_display, struct dp_display_private,
>>>>>>>>> dp_display);
>>>>>>>>>
>>>>>>>>>            dp_display->internal_hpd = true;
>>>>>>>>> +       dp_catalog_hpd_config_intr(dp->catalog,
>>>>>>>>> +                               DP_DP_HPD_PLUG_INT_MASK |
>>>>>>>>> +                               DP_DP_HPD_UNPLUG_INT_MASK,
>>>>>>>>> +                               true);
>>>>>>>>>     }
>>>>>>>>>
>>>>>>>>>     void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>>>>>>>>>     {
>>>>>>>>>            struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>>>>>>>>>            struct msm_dp *dp_display = dp_bridge->dp_display;
>>>>>>>>> +       struct dp_display_private *dp;
>>>>>>>>> +
>>>>>>>>> +       dp = container_of(dp_display, struct dp_display_private,
>>>>>>>>> dp_display);
>>>>>>>>>
>>>>>>>>> +       dp_catalog_hpd_config_intr(dp->catalog,
>>>>>>>>> +                               DP_DP_HPD_PLUG_INT_MASK |
>>>>>>>>> +                               DP_DP_HPD_UNPLUG_INT_MASK,
>>>>>>>>> +                               false);
>>>>>>>>>            dp_display->internal_hpd = false;
>>>>>>>>>     }
>>>>>>>> -- 
>>>>>>>> With best wishes
>>>>>>>> Dmitry
>>>>
>>
>>
