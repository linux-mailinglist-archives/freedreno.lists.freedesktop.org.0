Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED9704FC7
	for <lists+freedreno@lfdr.de>; Tue, 16 May 2023 15:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9266E10E0D1;
	Tue, 16 May 2023 13:50:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382A410E0D1
 for <freedreno@lists.freedesktop.org>; Tue, 16 May 2023 13:50:31 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4efd6e26585so16349210e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 16 May 2023 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684245029; x=1686837029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qloUU6Wz018FLFP/6/ZiZVsL8xQ4DAT7Q2vo3OazLUc=;
 b=SVdBBsFZwdlYytKSvhLM+ctaiOLMmdUus8GU4cFfXa/sIlxynM9mtPJNad2h6wiqKR
 dJ1Qg9oIqgKMiwo6cGYut//OKhVpHz6njQ0reoA6zOm9aq9IjsZSXfgPNzAs76XtoRw6
 ufty1BKnpUEL7MBM3sMdK9Nzenlf43QLfneXDyDtG2gvZ0IPo1eSIG+UhKExDoZwSH1N
 dYfy3PHVjpAIU+gBlDt4CCMSW74CaxML+rvfY2MOUvfXWwl1/u873qhXBj+ssKfwnDMA
 GQWSoGy71j5r/P9/T6CAQdkse1Pq5lRTOn/6wHuk34QG/4kBRxW/g68HP9blaUV5Q+3V
 0fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684245029; x=1686837029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qloUU6Wz018FLFP/6/ZiZVsL8xQ4DAT7Q2vo3OazLUc=;
 b=BGBL76cOaZnnTbn0oeRBMlXq1ZrsKGssN/usnk0TUONVo2JuJ/z0tjNF1U9clO+Jwt
 aC1OvVm5CmJtRMqLeidBoH39vaeB3qJ7oGnZ0SMMY+91WuvtmqxDlzAv+toxBzYNIkk2
 Mm7qBNW7bInHCeouBnuhI4XRF2f5vnESfzVOE6FwoeTTvuCAJhZB4mvURP/tjZmgfATW
 RC/iFO6RzQPYMGAEezxDwrGTomeDcyxZl2KvMSgzIWkBc6w2FtK+Ql3jnYREOWiACmqf
 yFHCxXXpuWlSvMXQtzj772Zd2x1HtGhOOx+WPOpx9/4WUTvOeTEIT88DU0/f0w0zV1r8
 ISoQ==
X-Gm-Message-State: AC+VfDyYlHi/LPMTqIAMdephccl8dbGhrIIbnvwlY6sRJlJzmDyq7zDH
 I9mRXCHM322CAosOx/3Dqxut1ziSid1E4iNk2/4=
X-Google-Smtp-Source: ACHHUZ7gnSTruCwO5rcBaAl7OThO+/s82DJbpLd3Tj4ugcQrYC9n0n9xiDfGFHlautbkSpnwqffVAQ==
X-Received: by 2002:ac2:5223:0:b0:4f1:5015:43c4 with SMTP id
 i3-20020ac25223000000b004f1501543c4mr7475760lfl.38.1684245028880; 
 Tue, 16 May 2023 06:50:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d5-20020ac24c85000000b004f38223eb7fsm822645lfl.102.2023.05.16.06.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 06:50:28 -0700 (PDT)
Message-ID: <6a2d1417-7333-7f8c-af87-628e5977aad6@linaro.org>
Date: Tue, 16 May 2023 16:50:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
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
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2d1fad81-c1dc-77db-de67-caf130af9767@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 13/05/2023 00:28, Abhinav Kumar wrote:
> Hi Bjorn and Dmitry
> 
> On 5/12/2023 12:34 PM, Kuogee Hsieh wrote:
>>
>> On 5/12/2023 10:28 AM, Dmitry Baryshkov wrote:
>>> On Fri, 12 May 2023 at 19:52, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>>> wrote:
>>>>
>>>> On 5/11/2023 5:54 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, 12 May 2023 at 03:16, Kuogee Hsieh 
>>>>> <quic_khsieh@quicinc.com> wrote:
>>>>>> On 5/11/2023 8:57 AM, Dmitry Baryshkov wrote:
>>>>>>> On 11/05/2023 18:53, Bjorn Andersson wrote:
>>>>>>>> On Thu, May 11, 2023 at 07:24:46AM +0300, Dmitry Baryshkov wrote:
>>>>>>>>> On Wed, 10 May 2023 at 23:31, Kuogee Hsieh 
>>>>>>>>> <quic_khsieh@quicinc.com>
>>>>>>>>> wrote:
>>>>>>>>>> The internal_hpd flag was introduced to handle external DP HPD
>>>>>>>>>> derived from GPIO
>>>>>>>>>> pinmuxed into DP controller. HPD plug/unplug interrupts cannot be
>>>>>>>>>> enabled until
>>>>>>>>>> internal_hpd flag is set to true.
>>>>>>>>>> At both bootup and resume time, the DP driver will enable 
>>>>>>>>>> external DP
>>>>>>>>>> plugin interrupts and handle plugin interrupt accordingly.
>>>>>>>>>> Unfortunately
>>>>>>>>>> dp_bridge_hpd_enable() bridge ops function was called to set
>>>>>>>>>> internal_hpd
>>>>>>>>>> flag to true later than where DP driver expected during bootup 
>>>>>>>>>> time.
>>>>>>>>>>
>>>>>>>>>> This causes external DP plugin event to not get detected and
>>>>>>>>>> display stays blank.
>>>>>>>>>> Move enabling HDP plugin/unplugged interrupts to
>>>>>>>>>> dp_bridge_hpd_enable()/disable() to
>>>>>>>>>> set internal_hpd to true along with enabling HPD plugin/unplugged
>>>>>>>>>> interrupts
>>>>>>>>>> simultaneously to avoid timing issue during bootup and resume.
>>>>>>>>>>
>>>>>>>>>> Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable
>>>>>>>>>> callbacks")
>>>>>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>>>>> Thanks for debugging this!
>>>>>>>>>
>>>>>>>>> However after looking at the driver I think there is more than 
>>>>>>>>> this.
>>>>>>>>>
>>>>>>>>> We have several other places gated on internal_hpd flag, where 
>>>>>>>>> we do
>>>>>>>>> not have a strict ordering of events.
>>>>>>>>> I see that dp_hpd_plug_handle() and dp_hpd_unplug_handle() also 
>>>>>>>>> toggle
>>>>>>>>> DP_DP_IRQ_HPD_INT_MASK and DP_DP_HPD_REPLUG_INT_MASK depending on
>>>>>>>>> internal_hpd. Can we toggle all 4 interrupts from the
>>>>>>>>> hpd_enable/hpd_disable functions? If we can do it, then I think 
>>>>>>>>> we can
>>>>>>>>> drop the internal_hpd flag completely.
>>>>>>>>>
> 
> No we cannot. The HPD logic works in a flip-flop model. When we get the 
> plug interrupt, we need to flip to tell the hw to wait for unplug and 
> when we get unplug, we need to tell the hw to wait for plug.

But, doesn't dp_display_config_hpd() (current code) or 
dp_bridge_hpd_enable() (after this patch) enable both plug and unplug 
interrupts? This doesn't fit well into the flip-flop description.

> 
> The two calls in plug_handle() / unplug_handle() are doing that whereas 
> hpd_enable/hpd_disable are disabling the hpd interrupts altogether.
> 
> In other words, we cannot rely on hpd_enable() / hpd_disable() calls to 
> do the flip part as that has to be done every plug/unplug. In addition 
> we need to handle the compliance test cases with REPLUG.

Thank you for the explanation. Would it be possible to keep mask/unmask, 
but make hpd_enable/hpd_disable toggle DP_DP_HPD_CTRL_HPD_EN instead?

> 
> So hpd_enable / hpd_disable is not the right place to move all these calls.
> 
>>>>>>>> Yes, that's what I believe the DRM framework intend us to do.
>>>>>>>>
>>>>>>>> The problem, and reason why I didn't do tat in my series, was 
>>>>>>>> that in
>>>>>>>> order to update the INT_MASKs you need to clock the IP-block and 
>>>>>>>> that's
>>>>>>>> done elsewhere.
>>>>>>>>
>>>>>>>> So, for the internal_hpd case, it seems appropriate to 
>>>>>>>> pm_runtime_get()
>>>>>>>> in hpd_enable() and unmask the HPD interrupts, and mask the 
>>>>>>>> interrupts
>>>>>>>> and pm_runtime_put() in hpd_disable().
>>>>>>>>
> 
> I dont agree completely on this. The blocks powering the HPD block also 
> power other things. So the AUX clk and host_init() both are needed for 
> HPD but they power not just the HPD.
> 
> So powering all of these at hpd_enable / hpd_disable would be an 
> overkill for that call and not required as well.

The main requirement behind hpd_enable/disable is that:
- hpd_enable makes sure that hpd events are properly detected and 
delivered afterwards.
- hpd_disable must unroll this. In other words, "Once [..hpd_disable..] 
returns the bridge shall not call drm_bridge_hpd_notify()".

> Before talking about removing hpd_event_thread, I think we should 
> understand why its there. It handles all asynchronous connection and 
> sink related events in one centralized place like 
> connect/disconnect/irq_hpd.
> 
> This is a well tested code with multiple dongles on chromebooks and I 
> dont see any alternative to it at the moment and dont think that 
> discussion is necessary in the context of this bug fix . We can talk 
> about it more in one of our sync ups if you want to know more.

Sync ups are private. Can we please keep this discussion public? It 
would be beneficial for other parties too (e.g. ChromeOS people).

The main issue with the current event thread is that it short cuts all 
HPD handling. This causes some uevents not being sent to the userspace, etc.

Please see below.


> Based on the responses I have seen so far, I see that we had to 
> introduce the dynamic control of internal_hpd for below case :
> 
> 2) DP without GPIO: Downstream drm_bridge connected, is_edp = false and
> internal HPD-logic should not be used/enabled (internal_hpd = false).
> Power doesn't need to be on unless hpd_notify is invoked to tell us that
> there's something connected...

Ideally, the DP block should be in the runtime suspension state, unless 
one of the following happens:

- hpd_enable() was called without consequent hpd_disable() call
- atomic_pre_enable() was called to start up the stream, 
atomic_post_disable() was not called yet
- get_edid() / get_modes() is in progress
- detect() is in progress
- eDP? I admit I do not fully understand the requirements there, so 
Stephen / Doug might be in a better position to comment about it

> 
> So we want internal_hpd to be false for this case.
> 
> That is good information and provides the context of why hpd_enable / 
> hpd_disable callbacks were implemented as they are optional as per the 
> framework.
> 
> I saw Bjorn mentioned that "The DRM framework will invoke hpd_enable on 
> the bridge furthest out that
> has OP_HPD. So in the case of HPD signal being pinmuxed into the
> HPD-logic, dp_bridge_hpd_enable() will be invoked.
> "
> 
> For my understanding, this logic is in the drm_bridge_connector_init() 
> right? So bridge_connector->bridge_detect will hold the last bridge and 
> hence enable_hpd / disable/hpd gets called only for the last one right?

You are mixing bridge_detect and bridge_hpd here. But yes, these 
pointers are initialized to the last bridges implementing 
correspondingly OP_DETECT / OP_HPD. Then drm_bridge_connector_detect() 
will call bridge_detect->detect(). drm_bridge_connector_enable_hpd() 
will call bridge_hpd->hpd_enable.

Note, the hpd_notify() callback will be called for all bridges in a chanin.

> 
> If all this is correct, I think the fix posted at the moment is the best 
> possible one as it correctly does what hpd_enable / hpd_disable 
> callbacks are supposed to do without overdoing it.
> 
> What are the concerns with this patch with all the explanation I have 
> given now.

I'd like to better understand the flip-flop story and the 
DP_DP_HPD_CTRL_HPD_EN.

Also, as you can see, the discussion of this patch popped up discussions 
for two other problems:
- power consumption / pm_runtime status
- HPD notifications

> 
>>>>>>>>
>>>>>>>> But for edp and external HPD-signal we also need to make sure 
>>>>>>>> power is
>>>>>>>> on while something is connected...
>>>>>>> I think this is already handled by the existing code, see calls 
>>>>>>> to the
>>>>>>> dp_display_host_init().
>>>>>>>
>>>>>>>>> I went on and checked other places where it is used:
>>>>>>>>> - dp_hpd_unplug_handle(), guarding DP_DP_HPD_PLUG_INT_MASK 
>>>>>>>>> toggling. I
>>>>>>>>> think we can drop these two calls completely. The function is 
>>>>>>>>> under
>>>>>>>>> the event_mutex protection, so other events can not interfere.
>>>>>>>>> - dp_bridge_hpd_notify(). What is the point of this check? If some
>>>>>>>>> other party informs us of the HPD event, we'd better handle it 
>>>>>>>>> instead
>>>>>>>>> of dropping it. Correct?  In other words, I'd prefer seeing the
>>>>>>>>> hpd_event_thread removal. Instead of that I think that on
>>>>>>>>> HPD/plug/unplug/etc. IRQ the driver should call into the drm 
>>>>>>>>> stack,
>>>>>>>>> then the hpd_notify call should process those events.

Now about the hpd_event_thread and the callbacks.

Currently the driver shortcuts the DRM infrastructure and tries to 
handle all the details / call sequences. This might be partially 
correct, but it definitely needs to be improved:

drm_bridge_connector_hpd_cb() also calls drm_kms_helper_hotplug_event(), 
which does other imporant things like sending uevent, notifying drm 
clients, etc. This part is completely missing for the internal_hpd case 
in the current driver.

Thus I suggest the following refactoring:

- On all HPD events the driver should call drm_bridge_hpd_notify(). For 
the REPLUG it might be required to perform two notifications in a sequence.

- drm_bridge_connector_hpd_cb() should be taught to pass through the 
(old_status == status) events (either in all cases or if the driver 
requests that)

- The dp_bridge_hpd_notify() will be called for all HPD events. This way 
it becomes natural to remove the !internal_hpd check from this function 
and handle all HPD events from the proper single place, hpd_notify.


>>>>>>>>>
> 
>>>>>> 1) DP with GPIO: No downstream drm_bridge are connected, is_edp = 
>>>>>> false
>>>>>> and internal HPD-logic is in used (internal_hpd = true). Power 
>>>>>> needs to
>>>>>> be on at all times etc.
>>>>>>
>>>>>> 2) DP without GPIO: Downstream drm_bridge connected, is_edp = 
>>>>>> false and
>>>>>> internal HPD-logic should not be used/enabled (internal_hpd = false).
>>>>>> Power doesn't need to be on unless hpd_notify is invoked to tell 
>>>>>> us that
>>>>>> there's something connected...
>>>>>>
>>>>>> - dp_bridge_hpd_notify(). What is the point of this check? <== i have
>>>>>> below two questions,
>>>>>>
>>>>>> 1) can you explain when/what this dp_bridge_hpd_notify() will be 
>>>>>> called?
>>>>> The call chain is drm_bridge_hpd_notify() ->
>>>>> drm_bridge_connector_hpd_notify() -> .hpd_notify() for all drm_bridge
>>>>> in chain
>>>>>
>>>>> One should add a call to drm_bridge_hpd_notify() when the hotplug
>>>>> event has been detected.
>>>>>
>>>>> Also please note the patch 
>>>>> https://patchwork.freedesktop.org/patch/484432/
>>>>>
>>>>>> 2) is dp_bridge_hpd_notify() only will be called at above case #2? 
>>>>>> and
>>>>>> it will not be used by case #1?
>>>>> Once the driver calls drm_bridge_hpd_notify() in the hpd path, the
>>>>> hpd_notify callbacks will be called in case#1 too.
>>>>>
>>>>> BTW: I don't see drm_bridge_hpd_notify() or
>>>>> drm_kms_{,connector_}_hotplug_event() HPD notifications in the DP
>>>>> driver at all. This should be fixed.
>>>> Just curious, since dp_bridge_detect() only return either
>>>> connector_status_connected or connector_status_disconnect,
>>>>
>>>> how IRQ_HPD_INT (attention) and HPD_REPLUG_INT be generated at DP 
>>>> case#1?
>>> if (bridge.status == connected && status == connected) {
>>>    either attention or replug were reported
>>> }
>>>
>>> BTW: what is HPD_REPLUG_INT, if you excuse my ignorance?
>>
>> HPD high -- drop to low for less than 2 ms -- go back to high again
>>
>> Currently, we have to treat this scenario as HPD_UNPLUG_int followed 
>> by HPD_PLUG_INT to pass compliance test
>>
>>>
>>>>>>
>>>>>>>> I agree, that seems to be what's expected of us from the DRM 
>>>>>>>> framework.


-- 
With best wishes
Dmitry

