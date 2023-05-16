Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99188705AA3
	for <lists+freedreno@lfdr.de>; Wed, 17 May 2023 00:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6098210E379;
	Tue, 16 May 2023 22:35:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AC410E379
 for <freedreno@lists.freedesktop.org>; Tue, 16 May 2023 22:35:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34GMUDtG009062; Tue, 16 May 2023 22:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1GaDJz5oNOkiLiJbaBz8MIVljo+DwVJ/KoZ9qf6FX9A=;
 b=NtDkWFd/8IZ4RJlZlJrhSjOPGY+ePRdTyTZg8M6XT9HrVz1VBEs7i3+W4h4OefyX9LZw
 zDYSQ2Kr+Tcdej8O+aZulR1SGpCR33Gtq/yKsJMk893fOCoNnmf7OmSOJOZyq4SZCgfH
 1pEXLIbvWgEB+ZZKEz7+8gsbhGFzq1LFXpNfHeutjbKoiEfCDeK0guLBvvboezvB/agE
 86Cvs4+c/D0Av0MEyb3FraUG53LSAwGt/l3Yg23kO7rvEOIX5fBIyrrmeMJoW6F4ANf8
 1e2Ki8PuaN5libExawAMuuTv6Oqh0hNV65PQqBVV49SYUddi1ksnyo2gBtn+C7VQ2R5e ww== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkkq9c8ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 22:35:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34GMZFMa023566
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 22:35:15 GMT
Received: from [10.110.94.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 16 May
 2023 15:35:15 -0700
Message-ID: <4a904c23-77b9-283d-ff6b-606f5a2606cb@quicinc.com>
Date: Tue, 16 May 2023 15:35:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
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
 <2d1fad81-c1dc-77db-de67-caf130af9767@quicinc.com>
 <6a2d1417-7333-7f8c-af87-628e5977aad6@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <6a2d1417-7333-7f8c-af87-628e5977aad6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FuYveQm6lAbvtfMUnto92uVrEs78qD2c
X-Proofpoint-ORIG-GUID: FuYveQm6lAbvtfMUnto92uVrEs78qD2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_12,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305160191
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



On 5/16/2023 6:50 AM, Dmitry Baryshkov wrote:
> On 13/05/2023 00:28, Abhinav Kumar wrote:
>> Hi Bjorn and Dmitry
>>
>> On 5/12/2023 12:34 PM, Kuogee Hsieh wrote:
>>>
>>> On 5/12/2023 10:28 AM, Dmitry Baryshkov wrote:
>>>> On Fri, 12 May 2023 at 19:52, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>>>> wrote:
>>>>>
>>>>> On 5/11/2023 5:54 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, 12 May 2023 at 03:16, Kuogee Hsieh 
>>>>>> <quic_khsieh@quicinc.com> wrote:
>>>>>>> On 5/11/2023 8:57 AM, Dmitry Baryshkov wrote:
>>>>>>>> On 11/05/2023 18:53, Bjorn Andersson wrote:
>>>>>>>>> On Thu, May 11, 2023 at 07:24:46AM +0300, Dmitry Baryshkov wrote:
>>>>>>>>>> On Wed, 10 May 2023 at 23:31, Kuogee Hsieh 
>>>>>>>>>> <quic_khsieh@quicinc.com>
>>>>>>>>>> wrote:
>>>>>>>>>>> The internal_hpd flag was introduced to handle external DP HPD
>>>>>>>>>>> derived from GPIO
>>>>>>>>>>> pinmuxed into DP controller. HPD plug/unplug interrupts 
>>>>>>>>>>> cannot be
>>>>>>>>>>> enabled until
>>>>>>>>>>> internal_hpd flag is set to true.
>>>>>>>>>>> At both bootup and resume time, the DP driver will enable 
>>>>>>>>>>> external DP
>>>>>>>>>>> plugin interrupts and handle plugin interrupt accordingly.
>>>>>>>>>>> Unfortunately
>>>>>>>>>>> dp_bridge_hpd_enable() bridge ops function was called to set
>>>>>>>>>>> internal_hpd
>>>>>>>>>>> flag to true later than where DP driver expected during 
>>>>>>>>>>> bootup time.
>>>>>>>>>>>
>>>>>>>>>>> This causes external DP plugin event to not get detected and
>>>>>>>>>>> display stays blank.
>>>>>>>>>>> Move enabling HDP plugin/unplugged interrupts to
>>>>>>>>>>> dp_bridge_hpd_enable()/disable() to
>>>>>>>>>>> set internal_hpd to true along with enabling HPD 
>>>>>>>>>>> plugin/unplugged
>>>>>>>>>>> interrupts
>>>>>>>>>>> simultaneously to avoid timing issue during bootup and resume.
>>>>>>>>>>>
>>>>>>>>>>> Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable
>>>>>>>>>>> callbacks")
>>>>>>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>>>>>> Thanks for debugging this!
>>>>>>>>>>
>>>>>>>>>> However after looking at the driver I think there is more than 
>>>>>>>>>> this.
>>>>>>>>>>
>>>>>>>>>> We have several other places gated on internal_hpd flag, where 
>>>>>>>>>> we do
>>>>>>>>>> not have a strict ordering of events.
>>>>>>>>>> I see that dp_hpd_plug_handle() and dp_hpd_unplug_handle() 
>>>>>>>>>> also toggle
>>>>>>>>>> DP_DP_IRQ_HPD_INT_MASK and DP_DP_HPD_REPLUG_INT_MASK depending on
>>>>>>>>>> internal_hpd. Can we toggle all 4 interrupts from the
>>>>>>>>>> hpd_enable/hpd_disable functions? If we can do it, then I 
>>>>>>>>>> think we can
>>>>>>>>>> drop the internal_hpd flag completely.
>>>>>>>>>>
>>
>> No we cannot. The HPD logic works in a flip-flop model. When we get 
>> the plug interrupt, we need to flip to tell the hw to wait for unplug 
>> and when we get unplug, we need to tell the hw to wait for plug.
> 
> But, doesn't dp_display_config_hpd() (current code) or 
> dp_bridge_hpd_enable() (after this patch) enable both plug and unplug 
> interrupts? This doesn't fit well into the flip-flop description.
> 

Let me clarify / correct the response. Ideally thats what is usually 
done to wait for disconnect when we get connect and vice-versa. HDMI 
still does it the same way.

https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c#L196

But I checked with kuogee that DP always enabled HPD connect and 
disconnect interrupts by default and he mentioned its mainly because we 
wanted to enable HPD connect / disconnect by default but not the others.

That being said, the logic is close to flip-flop that when you get a 
connect event, you wait for the "other" interrupts which are possible 
which is IRQ_HPD and REPLUG and during disconnect, those are not 
possible so disable them. Thats why the calls to 
dp_catalog_hpd_config_intr() are present in the plug_handle / 
unplug_handle to enable the "other possible" interrupts.

The logic from dp_display_config_hpd() is getting removed in this patch, 
in case you didnt check to align just with hpd_enable / hpd_disable 
callbacks.

>>
>> The two calls in plug_handle() / unplug_handle() are doing that 
>> whereas hpd_enable/hpd_disable are disabling the hpd interrupts 
>> altogether.
>>
>> In other words, we cannot rely on hpd_enable() / hpd_disable() calls 
>> to do the flip part as that has to be done every plug/unplug. In 
>> addition we need to handle the compliance test cases with REPLUG.
> 
> Thank you for the explanation. Would it be possible to keep mask/unmask, 
> but make hpd_enable/hpd_disable toggle DP_DP_HPD_CTRL_HPD_EN instead?
> 

Yes, this should be possible but we would like to test this. But what 
about the interrupt masks then. So you are saying, hpd_enable will only 
toggle the DP_DP_HPD_CTRL_HPD_EN but leave the HPD connect and 
disconnect interrupts intact? That also doesnt sound right.

enabling the block all the time and then toggling the interrupt masks 
seemed like a better thing.

>>
>> So hpd_enable / hpd_disable is not the right place to move all these 
>> calls.
>>
>>>>>>>>> Yes, that's what I believe the DRM framework intend us to do.
>>>>>>>>>
>>>>>>>>> The problem, and reason why I didn't do tat in my series, was 
>>>>>>>>> that in
>>>>>>>>> order to update the INT_MASKs you need to clock the IP-block 
>>>>>>>>> and that's
>>>>>>>>> done elsewhere.
>>>>>>>>>
>>>>>>>>> So, for the internal_hpd case, it seems appropriate to 
>>>>>>>>> pm_runtime_get()
>>>>>>>>> in hpd_enable() and unmask the HPD interrupts, and mask the 
>>>>>>>>> interrupts
>>>>>>>>> and pm_runtime_put() in hpd_disable().
>>>>>>>>>
>>
>> I dont agree completely on this. The blocks powering the HPD block 
>> also power other things. So the AUX clk and host_init() both are 
>> needed for HPD but they power not just the HPD.
>>
>> So powering all of these at hpd_enable / hpd_disable would be an 
>> overkill for that call and not required as well.
> 
> The main requirement behind hpd_enable/disable is that:
> - hpd_enable makes sure that hpd events are properly detected and 
> delivered afterwards.
> - hpd_disable must unroll this. In other words, "Once [..hpd_disable..] 
> returns the bridge shall not call drm_bridge_hpd_notify()".
> 

Yes, we are aware of it and this patch keeps that documented expectation 
intact. AFAICT, we want to skip dp_bridge_hpd_notify in the internal hpd 
case. Please note, like I wrote before, these callbacks are listed as 
optional

632 	 * This callback is optional and shall only be implemented by bridges
633 	 * that support hot-plug notification without polling. Bridges that
634 	 * implement it shall also implement the @hpd_disable callback and set
635 	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
636 	 */
637 	void (*hpd_enable)(struct drm_bridge *bridge);
638

So, the intention of introducing them to DP driver was to handle the 
case which Bjorn listed. Otherwise things are fine the way it is because 
like Stephen wrote, whether to use internal_hpd or not is a probe time 
decision, we really dont need to tie it with hpd_enable/hpd_disable 
callbacks.

>> Before talking about removing hpd_event_thread, I think we should 
>> understand why its there. It handles all asynchronous connection and 
>> sink related events in one centralized place like 
>> connect/disconnect/irq_hpd.
>>
>> This is a well tested code with multiple dongles on chromebooks and I 
>> dont see any alternative to it at the moment and dont think that 
>> discussion is necessary in the context of this bug fix . We can talk 
>> about it more in one of our sync ups if you want to know more.
> 
> Sync ups are private. Can we please keep this discussion public? It 
> would be beneficial for other parties too (e.g. ChromeOS people).
> 

> The main issue with the current event thread is that it short cuts all 
> HPD handling. This causes some uevents not being sent to the userspace, 
> etc.
> 
> Please see below.

Sure, but questioning why it exists and that it can be removed distracts 
folks from the objective of fixing the hpd issue.

I have some questions about your assessment of uevents not being sent to 
userspace . Answers below to that.

> 
> 
>> Based on the responses I have seen so far, I see that we had to 
>> introduce the dynamic control of internal_hpd for below case :
>>
>> 2) DP without GPIO: Downstream drm_bridge connected, is_edp = false and
>> internal HPD-logic should not be used/enabled (internal_hpd = false).
>> Power doesn't need to be on unless hpd_notify is invoked to tell us that
>> there's something connected...
> 
> Ideally, the DP block should be in the runtime suspension state, unless 
> one of the following happens:
> 
> - hpd_enable() was called without consequent hpd_disable() call
> - atomic_pre_enable() was called to start up the stream, 
> atomic_post_disable() was not called yet
> - get_edid() / get_modes() is in progress
> - detect() is in progress
> - eDP? I admit I do not fully understand the requirements there, so 
> Stephen / Doug might be in a better position to comment about it
> 

This list is correct except for the other aspect I explained.

Like you mentioned, we really need to power up the hpd block only when 
hpd_enable is called. But to power up the hpd block, we need:

-> AUX clk
-> mdss ahb clk
-> program hpd registers

We need to carefully isolate these out to hpd_enable / hpd_disable. This 
can be tried but will only delay this fix longer ... We can give it a shot.

All these concerns should have been thought of when actually introducing 
the internal_hpd flag and the hpd_enable / hpd_disable callbacks. But 
looks like neither sides did.

Anyway, like we always do, we can attempt cleaning this up like the way 
i have explained above to move the enable / disable of those 3 resources 
to hpd_enable / hpd_disable. Hopefully it works and is a small change.

>>
>> So we want internal_hpd to be false for this case.
>>
>> That is good information and provides the context of why hpd_enable / 
>> hpd_disable callbacks were implemented as they are optional as per the 
>> framework.
>>
>> I saw Bjorn mentioned that "The DRM framework will invoke hpd_enable 
>> on the bridge furthest out that
>> has OP_HPD. So in the case of HPD signal being pinmuxed into the
>> HPD-logic, dp_bridge_hpd_enable() will be invoked.
>> "
>>
>> For my understanding, this logic is in the drm_bridge_connector_init() 
>> right? So bridge_connector->bridge_detect will hold the last bridge 
>> and hence enable_hpd / disable/hpd gets called only for the last one 
>> right?
> 
> You are mixing bridge_detect and bridge_hpd here. But yes, these 
> pointers are initialized to the last bridges implementing 
> correspondingly OP_DETECT / OP_HPD. Then drm_bridge_connector_detect() 
> will call bridge_detect->detect(). drm_bridge_connector_enable_hpd() 
> will call bridge_hpd->hpd_enable.
> 

Thanks for confirming.

> Note, the hpd_notify() callback will be called for all bridges in a chanin.
> 
>>
>> If all this is correct, I think the fix posted at the moment is the 
>> best possible one as it correctly does what hpd_enable / hpd_disable 
>> callbacks are supposed to do without overdoing it.
>>
>> What are the concerns with this patch with all the explanation I have 
>> given now.
> 
> I'd like to better understand the flip-flop story and the 
> DP_DP_HPD_CTRL_HPD_EN.
> 
> Also, as you can see, the discussion of this patch popped up discussions 
> for two other problems:
> - power consumption / pm_runtime status
> - HPD notifications
> 

pm_runtime status is really not affected with this patch.

Even without this patch, the dp_display_host_deinit was called 
dp_pm_suspend which would have powered down the HPD related resources.

hpd_enable / hpd_disable callbacks from the DRM fwk only provide us 
another hook to do something which was already being done.

HPD notifications explained below.

>>
>>>>>>>>>
>>>>>>>>> But for edp and external HPD-signal we also need to make sure 
>>>>>>>>> power is
>>>>>>>>> on while something is connected...
>>>>>>>> I think this is already handled by the existing code, see calls 
>>>>>>>> to the
>>>>>>>> dp_display_host_init().
>>>>>>>>
>>>>>>>>>> I went on and checked other places where it is used:
>>>>>>>>>> - dp_hpd_unplug_handle(), guarding DP_DP_HPD_PLUG_INT_MASK 
>>>>>>>>>> toggling. I
>>>>>>>>>> think we can drop these two calls completely. The function is 
>>>>>>>>>> under
>>>>>>>>>> the event_mutex protection, so other events can not interfere.
>>>>>>>>>> - dp_bridge_hpd_notify(). What is the point of this check? If 
>>>>>>>>>> some
>>>>>>>>>> other party informs us of the HPD event, we'd better handle it 
>>>>>>>>>> instead
>>>>>>>>>> of dropping it. Correct?  In other words, I'd prefer seeing the
>>>>>>>>>> hpd_event_thread removal. Instead of that I think that on
>>>>>>>>>> HPD/plug/unplug/etc. IRQ the driver should call into the drm 
>>>>>>>>>> stack,
>>>>>>>>>> then the hpd_notify call should process those events.
> 
> Now about the hpd_event_thread and the callbacks.
> 
> Currently the driver shortcuts the DRM infrastructure and tries to 
> handle all the details / call sequences. This might be partially 
> correct, but it definitely needs to be improved:
> 
> drm_bridge_connector_hpd_cb() also calls drm_kms_helper_hotplug_event(), 
> which does other imporant things like sending uevent, notifying drm 
> clients, etc. This part is completely missing for the internal_hpd case 
> in the current driver.
> 

Today the DP driver calls drm_helper_hpd_irq_event to notify events 
which calls drm_kms_helper_hotplug_event internally. So what part is 
missing?

> Thus I suggest the following refactoring:
> 
> - On all HPD events the driver should call drm_bridge_hpd_notify(). For 
> the REPLUG it might be required to perform two notifications in a sequence.
> 

I am seeing this from users in drm/bridge (that is external hpd) which 
makes sense. So if I understand this better, in external_hpd case I do 
see its purpose as this info has to be passed down from the bridge to 
the Display controller through the drm fwk, not for the internal_hpd 
case because in that case the controller already knows as it is the one 
generating this interrupt.

> - drm_bridge_connector_hpd_cb() should be taught to pass through the 
> (old_status == status) events (either in all cases or if the driver 
> requests that)
> 
> - The dp_bridge_hpd_notify() will be called for all HPD events. This way 
> it becomes natural to remove the !internal_hpd check from this function 
> and handle all HPD events from the proper single place, hpd_notify.
> 
> 

>>>>>>>>>>
>>
>>>>>>> 1) DP with GPIO: No downstream drm_bridge are connected, is_edp = 
>>>>>>> false
>>>>>>> and internal HPD-logic is in used (internal_hpd = true). Power 
>>>>>>> needs to
>>>>>>> be on at all times etc.
>>>>>>>
>>>>>>> 2) DP without GPIO: Downstream drm_bridge connected, is_edp = 
>>>>>>> false and
>>>>>>> internal HPD-logic should not be used/enabled (internal_hpd = 
>>>>>>> false).
>>>>>>> Power doesn't need to be on unless hpd_notify is invoked to tell 
>>>>>>> us that
>>>>>>> there's something connected...
>>>>>>>
>>>>>>> - dp_bridge_hpd_notify(). What is the point of this check? <== i 
>>>>>>> have
>>>>>>> below two questions,
>>>>>>>
>>>>>>> 1) can you explain when/what this dp_bridge_hpd_notify() will be 
>>>>>>> called?
>>>>>> The call chain is drm_bridge_hpd_notify() ->
>>>>>> drm_bridge_connector_hpd_notify() -> .hpd_notify() for all drm_bridge
>>>>>> in chain
>>>>>>
>>>>>> One should add a call to drm_bridge_hpd_notify() when the hotplug
>>>>>> event has been detected.
>>>>>>
>>>>>> Also please note the patch 
>>>>>> https://patchwork.freedesktop.org/patch/484432/
>>>>>>
>>>>>>> 2) is dp_bridge_hpd_notify() only will be called at above case 
>>>>>>> #2? and
>>>>>>> it will not be used by case #1?
>>>>>> Once the driver calls drm_bridge_hpd_notify() in the hpd path, the
>>>>>> hpd_notify callbacks will be called in case#1 too.
>>>>>>
>>>>>> BTW: I don't see drm_bridge_hpd_notify() or
>>>>>> drm_kms_{,connector_}_hotplug_event() HPD notifications in the DP
>>>>>> driver at all. This should be fixed.
>>>>> Just curious, since dp_bridge_detect() only return either
>>>>> connector_status_connected or connector_status_disconnect,
>>>>>
>>>>> how IRQ_HPD_INT (attention) and HPD_REPLUG_INT be generated at DP 
>>>>> case#1?
>>>> if (bridge.status == connected && status == connected) {
>>>>    either attention or replug were reported
>>>> }
>>>>
>>>> BTW: what is HPD_REPLUG_INT, if you excuse my ignorance?
>>>
>>> HPD high -- drop to low for less than 2 ms -- go back to high again
>>>
>>> Currently, we have to treat this scenario as HPD_UNPLUG_int followed 
>>> by HPD_PLUG_INT to pass compliance test
>>>
>>>>
>>>>>>>
>>>>>>>>> I agree, that seems to be what's expected of us from the DRM 
>>>>>>>>> framework.
> 
> 
