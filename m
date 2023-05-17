Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F03C70730C
	for <lists+freedreno@lfdr.de>; Wed, 17 May 2023 22:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98F10E2AA;
	Wed, 17 May 2023 20:31:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57CA10E471
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 20:31:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HJwImK001671; Wed, 17 May 2023 20:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NtM74VtNRc+QeuMP2S4le5rV+0dlutwirJ21ED9MSYs=;
 b=lYw9807oloNBxnN5a9WtnPeHppWRNtdlmTC9iP+/+D0jPpuUkvPUJjTKPuyVdYTrxZLH
 HNwuh5byCv9YLN+wAr3wPGZdrAJO2iYz21DExtquwAdHqu3em8V/Jh+55il+6cVv63m3
 urQ1tgcDwA8RpPOPVXkUjXPUs5cJ5sXBNXNMHP0/4XDuOa67PU1+NVZLBho/pSO5JS/E
 8O9+ioUlMQZj59azeHuVtlOkjMNKWPnoiJxDnZ4KVHp3sweCX4kytw/hIVhq8Qau8Jde
 Qx6lsdBZvWF2d4Jd5b+SIQvCiTqOIVT8rkv0X2A44kdAM/b5xbaQByIkshFVrzktk+V8 mw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmjadjmk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 20:31:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HKV3WO024938
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 20:31:03 GMT
Received: from [10.110.94.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 17 May
 2023 13:31:02 -0700
Message-ID: <19729fdd-ba80-01fb-f5ee-5ab81d0e973e@quicinc.com>
Date: Wed, 17 May 2023 13:31:02 -0700
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
 <4a904c23-77b9-283d-ff6b-606f5a2606cb@quicinc.com>
 <02a63057-5c2a-5e26-d8e0-95a2c49a5e5e@linaro.org>
 <094834a4-d7c2-64d4-7658-cf039f8c7d69@quicinc.com>
 <CAA8EJpoF2OhUJhcJ=R+ecSQvLjLMq_yZksjx5Lz=uuSnvt6mkg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoF2OhUJhcJ=R+ecSQvLjLMq_yZksjx5Lz=uuSnvt6mkg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: rw3CQRfqGI-2LSgZcSckuJocHWeQ9Wnd
X-Proofpoint-GUID: rw3CQRfqGI-2LSgZcSckuJocHWeQ9Wnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170169
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



On 5/17/2023 11:48 AM, Dmitry Baryshkov wrote:
> On Wed, 17 May 2023 at 20:42, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>>
>> On 5/16/2023 4:20 PM, Dmitry Baryshkov wrote:
>>> On 17/05/2023 01:35, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 5/16/2023 6:50 AM, Dmitry Baryshkov wrote:
>>>>> On 13/05/2023 00:28, Abhinav Kumar wrote:
>>>>>> Hi Bjorn and Dmitry
>>>>>>
>>>>>> On 5/12/2023 12:34 PM, Kuogee Hsieh wrote:
>>>>>>>
>>>>>>> On 5/12/2023 10:28 AM, Dmitry Baryshkov wrote:
>>>>>>>> On Fri, 12 May 2023 at 19:52, Kuogee Hsieh
>>>>>>>> <quic_khsieh@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>> On 5/11/2023 5:54 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Fri, 12 May 2023 at 03:16, Kuogee Hsieh
>>>>>>>>>> <quic_khsieh@quicinc.com> wrote:
>>>>>>>>>>> On 5/11/2023 8:57 AM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On 11/05/2023 18:53, Bjorn Andersson wrote:
>>>>>>>>>>>>> On Thu, May 11, 2023 at 07:24:46AM +0300, Dmitry Baryshkov
>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>> On Wed, 10 May 2023 at 23:31, Kuogee Hsieh
>>>>>>>>>>>>>> <quic_khsieh@quicinc.com>
>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>>> The internal_hpd flag was introduced to handle external DP
>>>>>>>>>>>>>>> HPD
>>>>>>>>>>>>>>> derived from GPIO
>>>>>>>>>>>>>>> pinmuxed into DP controller. HPD plug/unplug interrupts
>>>>>>>>>>>>>>> cannot be
>>>>>>>>>>>>>>> enabled until
>>>>>>>>>>>>>>> internal_hpd flag is set to true.
>>>>>>>>>>>>>>> At both bootup and resume time, the DP driver will enable
>>>>>>>>>>>>>>> external DP
>>>>>>>>>>>>>>> plugin interrupts and handle plugin interrupt accordingly.
>>>>>>>>>>>>>>> Unfortunately
>>>>>>>>>>>>>>> dp_bridge_hpd_enable() bridge ops function was called to set
>>>>>>>>>>>>>>> internal_hpd
>>>>>>>>>>>>>>> flag to true later than where DP driver expected during
>>>>>>>>>>>>>>> bootup time.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> This causes external DP plugin event to not get detected and
>>>>>>>>>>>>>>> display stays blank.
>>>>>>>>>>>>>>> Move enabling HDP plugin/unplugged interrupts to
>>>>>>>>>>>>>>> dp_bridge_hpd_enable()/disable() to
>>>>>>>>>>>>>>> set internal_hpd to true along with enabling HPD
>>>>>>>>>>>>>>> plugin/unplugged
>>>>>>>>>>>>>>> interrupts
>>>>>>>>>>>>>>> simultaneously to avoid timing issue during bootup and
>>>>>>>>>>>>>>> resume.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable
>>>>>>>>>>>>>>> callbacks")
>>>>>>>>>>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>>>>>>>>>> Thanks for debugging this!
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> However after looking at the driver I think there is more
>>>>>>>>>>>>>> than this.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> We have several other places gated on internal_hpd flag,
>>>>>>>>>>>>>> where we do
>>>>>>>>>>>>>> not have a strict ordering of events.
>>>>>>>>>>>>>> I see that dp_hpd_plug_handle() and dp_hpd_unplug_handle()
>>>>>>>>>>>>>> also toggle
>>>>>>>>>>>>>> DP_DP_IRQ_HPD_INT_MASK and DP_DP_HPD_REPLUG_INT_MASK
>>>>>>>>>>>>>> depending on
>>>>>>>>>>>>>> internal_hpd. Can we toggle all 4 interrupts from the
>>>>>>>>>>>>>> hpd_enable/hpd_disable functions? If we can do it, then I
>>>>>>>>>>>>>> think we can
>>>>>>>>>>>>>> drop the internal_hpd flag completely.
>>>>>>>>>>>>>>
>>>>>>
>>>>>> No we cannot. The HPD logic works in a flip-flop model. When we get
>>>>>> the plug interrupt, we need to flip to tell the hw to wait for
>>>>>> unplug and when we get unplug, we need to tell the hw to wait for
>>>>>> plug.
>>>>>
>>>>> But, doesn't dp_display_config_hpd() (current code) or
>>>>> dp_bridge_hpd_enable() (after this patch) enable both plug and
>>>>> unplug interrupts? This doesn't fit well into the flip-flop
>>>>> description.
>>>>>
>>>>
>>>> Let me clarify / correct the response. Ideally thats what is usually
>>>> done to wait for disconnect when we get connect and vice-versa. HDMI
>>>> still does it the same way.
>>>>
>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c#L196
>>>>
>>>
>>> So, HDMI HPD is real flip-flop, sounds fine.
>>>
>>>>
>>>> But I checked with kuogee that DP always enabled HPD connect and
>>>> disconnect interrupts by default and he mentioned its mainly because
>>>> we wanted to enable HPD connect / disconnect by default but not the
>>>> others.
>>>>
>>>> That being said, the logic is close to flip-flop that when you get a
>>>> connect event, you wait for the "other" interrupts which are possible
>>>> which is IRQ_HPD and REPLUG and during disconnect, those are not
>>>> possible so disable them. Thats why the calls to
>>>> dp_catalog_hpd_config_intr() are present in the plug_handle /
>>>> unplug_handle to enable the "other possible" interrupts.
>>>
>>> Can we keep them always enabled? Are these interrupts edge-triggered
>>> or level-triggered? What prevents us from enabling these interrupts
>>> all the time? Or enabling all 4 interrupts in hpd_enable() and
>>> disabling them in hpd_disable()? Can IRQ_HPD or REPLUG fire when the
>>> cable is disconnected?
>>
>>> 1) edge-trigger at hpd pin low. However hpd block will start
>>> debouncing logic and set status bit (plug, unplug, hpd_irq ore replug)
>>> properly base on the result of debunce.
>>
>> 2) there should be fine to have all interrupts enabled
>>
>> 3) IRQ_HPD and REPLUG will not happen when disconnected.
>>
>>
>>>>
>>>> The logic from dp_display_config_hpd() is getting removed in this
>>>> patch, in case you didnt check to align just with hpd_enable /
>>>> hpd_disable callbacks.
>>>
>>> I saw this. The code is being moved to dp_bridge_hpd_enable(), as I
>>> mentioned in the email.
>>>
>>>>
>>>>>>
>>>>>> The two calls in plug_handle() / unplug_handle() are doing that
>>>>>> whereas hpd_enable/hpd_disable are disabling the hpd interrupts
>>>>>> altogether.
>>>>>>
>>>>>> In other words, we cannot rely on hpd_enable() / hpd_disable()
>>>>>> calls to do the flip part as that has to be done every plug/unplug.
>>>>>> In addition we need to handle the compliance test cases with REPLUG.
>>>>>
>>>>> Thank you for the explanation. Would it be possible to keep
>>>>> mask/unmask, but make hpd_enable/hpd_disable toggle
>>>>> DP_DP_HPD_CTRL_HPD_EN instead?
>>>>>
>>>>
>>>> Yes, this should be possible but we would like to test this. But what
>>>> about the interrupt masks then. So you are saying, hpd_enable will
>>>> only toggle the DP_DP_HPD_CTRL_HPD_EN but leave the HPD connect and
>>>> disconnect interrupts intact? That also doesnt sound right.
>>>>
>>>> enabling the block all the time and then toggling the interrupt masks
>>>> seemed like a better thing.
>>>
>>> Why? We do not need the block outside of the
>>> hpd_enable()/hpd_disable() pair. Even from the power consumption
>>> perspective, disabling the unused block sounds better to me.
>>
>>
>> We are mean within the block of hpd_enabled and hdp_disabled pair,
>>
>> At hpd_enabled, we will do both item 1) and 2) instead of just only item
>> 1) as you mentioned.  you still need power on hpd block to just do item2).
>>
>> 1) enabled DP_DP_HPD_CTRL_HPD_EN
>>
>> 2) enable HDP interrupts (plug, unplug, hpd_irq and replug)
> 
> If I got you correct (and you are proposing to move
> DP_DP_HPD_CTRL_HPD_EN and toggling all 4 interrupts to
> hpd_enable/hpd_disable), this should be fine with me. It will allow us
> to remove most of the internal_hpd cruft while keeping the logic
> functional. I'm looking forward to seeing this patch.
> 

Yes, thats what he meant. It wont make sense to only toggle HPD_EN so we 
will give it a try to toggle both HPD_EN and the 4 interrupts and 
related logic.

The scope of this patch has increased resulting in the need for more 
re-validation. So the v2 shall be only posted next week.
