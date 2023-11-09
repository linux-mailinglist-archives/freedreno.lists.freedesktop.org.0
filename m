Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BD77E7440
	for <lists+freedreno@lfdr.de>; Thu,  9 Nov 2023 23:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B0D10E401;
	Thu,  9 Nov 2023 22:13:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4784310E401
 for <freedreno@lists.freedesktop.org>; Thu,  9 Nov 2023 22:12:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A9LCxVH014060
 for <freedreno@lists.freedesktop.org>; Thu, 9 Nov 2023 22:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=33KgG6CHRSEf7MnBCq8lZczbZPWe46CFEV0c6Ljv3XE=;
 b=NRY+fsLLPhvR03oihCNwlNjE073EcbOPdZEtmWfa98fr/vgyU9as0Gv5UgGRjvD20Uqr
 rgKrNXs3mjdnoP2UqqRQT1LgXnKXLV0WQrS0UoPs5ykW1YI1Elts552ah26G9KjYvZcO
 YV+S1YwM8WuYHzOvrdk4EVdRMCMgqOQbuALH8E+IhH2g2Q4KVMeVJ1qxUFr9XPaVZpmm
 VXsrhtDAdjchKq0/s+6iHtAX6qGmfhTYYrbi6XQZUEX/tBEn/joWIb7R90bKng5EiWCv
 brHZANnYsoQbFbl6Qj+YHtnfxYRX2oKaYzTKC9RpHARUfOR5Px9f9Se/zuoyHAVSo7yy dA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u93tq8ky3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 09 Nov 2023 22:12:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A9MCtG5029372
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 9 Nov 2023 22:12:55 GMT
Received: from [10.110.84.171] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 9 Nov
 2023 14:12:55 -0800
Message-ID: <7862d3a6-bf53-b705-e601-65852e38dcf2@quicinc.com>
Date: Thu, 9 Nov 2023 14:12:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: <freedreno@lists.freedesktop.org>
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpoFRp+7GyO=F3Ar21tfG5Yt0cL6zkAquqg7D1XXQjp50Q@mail.gmail.com>
 <55a4f98e-2772-e4fd-ae8a-132f92582c78@quicinc.com>
 <CAA8EJpo9CFf-Z3eiuKPvwf-y6eGkSibro-q-=SBxKK_L-zFOBA@mail.gmail.com>
 <b708df07-6812-df43-1313-cf6f1289fd47@quicinc.com>
 <d597554a-ad3a-0af1-e21b-3001c80f6d30@quicinc.com>
 <748da144-af4c-5a2a-e82b-3a870995cbce@quicinc.com>
 <CAA8EJppsyS_BTWwtVdX-B3V=O7nSWsadW4G6o-nshUNo-Z71rQ@mail.gmail.com>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJppsyS_BTWwtVdX-B3V=O7nSWsadW4G6o-nshUNo-Z71rQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dLMSErx4qP_CLaVsgjFnjAdFrnjLGrQL
X-Proofpoint-ORIG-GUID: dLMSErx4qP_CLaVsgjFnjAdFrnjLGrQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_14,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311090161
Subject: Re: [Freedreno] [PATCH v7 0/7] incorporate pm runtime framework and
 eDP clean up
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


On 11/9/2023 12:35 PM, Dmitry Baryshkov wrote:
> Hello Kuogee,
>
>
> On Thu, 9 Nov 2023 at 19:51, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 11/8/2023 10:27 AM, Abhinav Kumar wrote:
>>>
>>> On 11/8/2023 10:10 AM, Kuogee Hsieh wrote:
>>>> On 11/7/2023 1:23 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, 7 Nov 2023 at 23:01, Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>> wrote:
>>>>>> On 11/6/2023 5:55 PM, Dmitry Baryshkov wrote:
>>>>>>> On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh
>>>>>>> <quic_khsieh@quicinc.com> wrote:
>>>>>>>> The purpose of this patch series is to incorporate pm runtime
>>>>>>>> framework
>>>>>>>> into MSM eDP/DP driver so that eDP panel can be detected by DRM
>>>>>>>> eDP panel
>>>>>>>> driver during system probe time. During incorporating procedure,
>>>>>>>> original
>>>>>>>> customized pm realted fucntions, such as dp_pm_prepare(),
>>>>>>>> dp_pm_suspend(),
>>>>>>>> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with
>>>>>>>> functions
>>>>>>>> provided by pm runtiem framework such as
>>>>>>>> pm_runtime_force_suspend() and
>>>>>>>> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq
>>>>>>>> handler
>>>>>>>> are bound at system probe time too.
>>>>>>> With this patchset in place I can crash the board using the following
>>>>>>> sequence (SM8350-HDK):
>>>>>>>
>>>>>>> - plug the USBC DP dongle
>>>>>>> - run modetest at any mode, don't press Enter yet
>>>>>>> - unplug the dongle
>>>>>>> - press Enter to stop modetest
>>>>>>>
>>>>>>> => the board resets to Sahara.
>>>>>>>
>>>>>>> Please ping me if you need any additional information from my side.
>>>>>> questiosn,
>>>>>>
>>>>>> 1) which dongle are you used?
>>>>> I have used several Dell and Hama USB-C dongles.
>>>>>
>>>>>> 2) what code branch shoud I used to duplicate this problem.
>>>>> I have pushed my kernel tree to
>>>>> git.codelinaro.org/dmitry.baryshkov/linux.git, branch test-dp-rpm
>>>>> I had several UCSI patches on top, but they should not be relevant.
>>>> git.codelinaro.org/dmitry.baryshkov/linux.git, branch test-dp-rpm <==
>>>> I synced out his branch and it is still work at my chromebook Kodiak
>>>> DUT.
>>> Perhaps the gap in test results with the same tree is due to internal
>>> hpd vs hpd pin. We need to try this on a device which does not use
>>> internal hpd.
>>
>> Hi Dmitry,
> First of all, I was able to reproduce the issue without this patch
> series. Kuogee, I must ask your pardon, it is not a regression and it
> is not caused by this series.
> So, we have a bug, but not a regression.

np, i will keep debugging this issue but with a little low priority.

I think we like to have exactly same dongle as you have to duplicate 
this problem.

Would you please provide the manufacture and model number of the dongle?


>
> Second, a stable reproducer:
>
> When you unplug and re-plug the dongle, switch the orientation of the dongle.
> This way the system crashes in 100% of cases.
sorry, I am new to HDK device. where and how to switch the orientation 
of the dongle?
> Here are the last messages that I see on my console:
>
> trying to open device 'tilcdc'...failed
> trying to open device 'msm'...done
> setting mode 3840x2160-30.00Hz on connectors 34, crtc 84
> failed to set gamma: Function not implemented
> [   25.504828] [drm:dpu_encoder_phys_vid_wait_for_commit_done:487]
> [dpu error]vblank timeout
> [   25.515024] [drm:dpu_kms_wait_for_commit_done:494] [dpu error]wait
> for commit done returned -110
> [   25.621146] [drm:dpu_encoder_frame_done_timeout:2342] [dpu
> error]enc33 frame done timeout
> Format: Log Type - Time(microsec) - Message - Optional Info
> Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
> S - QC_IMAGE_VERSION_STRING=BOOT.MXF.1.0-00848-LAHAINA-1
Those messages looks like timing engine configuration is not correct.
>
>> I have two more questions,
>>
>> 1) are you see test pattern shows at external DP when you run modetest?
> Yes, I see the pattern
>
>> 2) is *.kcrash file created under /var/spool/crash/ when system crashed.
>> If it is, can you share it?
> There is no kcrash, as there is no kernel crash. The system reboots to
> the download mode.
>
>> Thanks,
>>
>>>>>> I can not duplicate  system crash problem at my setup kodiak (SM7325)
>>>>>> chrome book with my PM runtime patch series.
>>>>>>
>>>>>> my code base is Linux 6.6-rc2 + pm runtime patch series (7 patches)
>>>>>>
>>>>>> I did:
>>>>>>
>>>>>> 1) plugin either apple dongle (DP-to-HDMI) + 1080p display or DP typeC
>>>>>> cable directly to 1080p display
>>>>>>
>>>>>> 2)  stop ui
>>>>>>
>>>>>> 3) /usr/bin/modetest -M msm -s 34:1920x1080 (see test pattern show at
>>>>>> display)
>>>>>>
>>>>>> 4) unplug apple dongle or DP typeC cable
>>>>>>
>>>>>> 5) hit enter key
>>>>>>
>>>>>> 6) start ui
>>>>>>
>>>>>> 7) display back to login page of chrome book
>>>>>>
>>>>>>
>
>
