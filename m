Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMmzHoFppWntAAYAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 11:42:09 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9658A1D6B87
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 11:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A83C10E489;
	Mon,  2 Mar 2026 10:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gehtB3FB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfuBeZ8t";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB78110E483
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 10:42:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6229FH0Q3631477
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 10:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H5oh1Y3E4ZRYRy45drg9tJ/H8Kljy9D160tvJTu3A5M=; b=gehtB3FB48mBjiiP
 qB2zbLDdWTGKmktVVGRoTWZHgUXMqyQN5EQC3AMsWy4m2hkA1ZDvTwlYxdP00SGL
 bilemr6YV5YirSHDQaKyy2toFpuH8xGNpsLgEeJVrzBpd4FKRrFlQldVzdsbOog8
 /upllLXqicWm4m1pOYzh1bZDAnsoBxvNwFi9HI4wIgV6zJ3iVzcun0H8hR2zt7zE
 XNj5tOXBomSDcTDNuiUtRXb3vdW3UnEgEdfwWWMu0Dnnl8z1XWGhvYO2vIiquDRF
 Hih/1iFRjTlDOXnuZob8c1QDQWrgHW9r0RxuThue/Kn4HE8Jzgb7LqIAXMA2XFHv
 3E+hXA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhra72-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 10:42:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-899b4b45befso42966246d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 02:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772448124; x=1773052924;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H5oh1Y3E4ZRYRy45drg9tJ/H8Kljy9D160tvJTu3A5M=;
 b=OfuBeZ8tCjOsShiXGY01skB5qg5DEL/CfnqjRzCdgaGqiWxDECzv7H0tTt7eis/2in
 MtMGQ0+eRiN5rhLysCbr+gE/L+jx/NJc/NtnvDdpxFjFf8qUQsl4es4S0D/QTKWB5dUb
 HGCwI/iaHYFWALkjYt96nAf9D2iYGIQi5bRSb8SMu77fb4t6c5xJ3q2HSk/Clh9wXS49
 XOlkAbGNXwKriBr+MhoxtEpxNEmdSwQw7MCBHaGgTAk/6vlzUj/HxHh8I8i0ozo5yyXo
 lZuaAbv7jJ3LiC0VsWheDGbDfEdKolhQUJr2pzmRVnhH2wSMIbUpwJvzXQuNAx24eVaY
 GimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772448124; x=1773052924;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H5oh1Y3E4ZRYRy45drg9tJ/H8Kljy9D160tvJTu3A5M=;
 b=f0NqfCzx03l2VAv15JuendKaPEZV4HGx7fE01nsIjBXuioKE11fltVL6GJ3vrMds4M
 DSy8ZBtadCM9xLie3/0HehuTiTPipvInDbwsbE0NizelegJ5+Qor+NnB5z7l3pVTmi9e
 Pd2sCHcS5xQDcuZh0x/eKWUszo8sTZ/RlEI1RgTOwe8iw1hiX1tjr0HpbxVytrNVSg7z
 F0mSfz36qOWY/Z48FexBA9rhR2NueapD8QfwAFRRvVfEQoVqWkMEUm/ubjYiUQQMBRVD
 JHgMwXhxqSMiCC4Vjy6StnmGnWWnj0tR6gxAtu2+cfZOVICSosVzvbjdS1ItB9N559wN
 XBmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy+DWlWr1r5FBoVZoddxTZJNXM9cEjv24esLEKEnKi/pqDQn8GzZPvcuRrmszA0OZudZRjULlPLKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyINMNWMjPEGKvVCN/+BmYAUoKLSG6GFWRM9Yhw59g2XnN/yvcV
 4h7jSo3R2Nw6T5nnGy4jhVKK29HNI09vH9Xs+BjPSeG2dIVg2ueFhQG5XwFm5b5CVT/e9Rvngkp
 G4+/YKxZn64KSa2OGYNwTVpRE7ry9QYXplPUlYSMoHw0GB8ORir5sZ8oL61iOvTaDAzH2q+8=
X-Gm-Gg: ATEYQzx1QGp37F/uXU3OGYLeb11vNC/0gvmrEoRyl5kz3SsJXVbQJZGgsM8ZZTL/bxr
 rGdiT74sSxKLjWYmuODDogqynXgRe2iJsyO8I6CPdeUFjMvSIXawcKWjuglSzwNJaJ9xjWvonh2
 tWE2fZ2kmJboDOykVdh4pDLgtmR10usNsBGe2nssIW611rJ7xyhpG6MK0/SQNOsApmFWARDouWp
 vBliouvsHswltKX9nJb9BTTHhv51V4FOiI3sTrVRUnFsJ5Q78Q/2p2vDLZvuy7lIUuouo2zhyjb
 o0G1HX9Qbpqlh5z9RiKhEv2LQFBYIRWivIqjmkITUWEmcfqtczj636Zw9uUdso3qhFiqY0XcunF
 4poHdB8V/XdqZfrqXeXa3/UG5U1gzIt+5GTcUi61oR1kPkM9tzA6aXCS1P2Vc3R5VFEaQf3zb3e
 +kh54=
X-Received: by 2002:a05:6214:4705:b0:899:bff4:af84 with SMTP id
 6a1803df08f44-899d1ebc53cmr112436216d6.7.1772448123934; 
 Mon, 02 Mar 2026 02:42:03 -0800 (PST)
X-Received: by 2002:a05:6214:4705:b0:899:bff4:af84 with SMTP id
 6a1803df08f44-899d1ebc53cmr112435966d6.7.1772448123479; 
 Mon, 02 Mar 2026 02:42:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae60c16sm455580666b.38.2026.03.02.02.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 02:42:02 -0800 (PST)
Message-ID: <d5c4eed5-bd87-4156-b178-2d78140ec8a9@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 11:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1sC_yLs1tpdNvKF4RheeuCuPFijkv-ZD
X-Proofpoint-GUID: 1sC_yLs1tpdNvKF4RheeuCuPFijkv-ZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NyBTYWx0ZWRfX97Dp4VYGUYD2
 Z+21zcfEhNQ3KQwQNoqp2D+2Ak6XcrEIwtKiu7coU9hbY8+Hkjhs+rdA5ZBPFlGzX00Dz66jEj/
 LQYatgcKSpRNosPSDX/1BP9LHGxJBI+PI5zWquI8rVWu/IbUZBeNZwNTtaDaHS+bEG8J3SCVOi0
 GX6qesPCM+w8vc/yNTVPyioIRgBcKSR16OAPIaXDpA18JhsylQx7yDY/a7T5C3+wd3rptn9CJza
 /u+/SR1l52lpyHx1wtyxVYo8ImqvpztoDAoKScdly0cuSbLs72XzcAh5xeQoGe/7vxIKmVXfvtD
 PoCgrZEAUqRUHLSTnmj5UVpUiSoe336cBIAbp2stYWzH45OtROYrOHIeHhlbhClobijdfOhfeKl
 iHVckQmBIKZ70V+QcW+jTFO6oeCUCY5IRhSybCcABt5ohKT6tZUpgN6dOzTLp/GnYzYac6yCVpH
 xO7RRiRqyRIv/XJYIoQ==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a5697c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GNz5de_MuxAREYx-QrcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020087
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:yuanjie.yang@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzysztof.kozlowski@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:yongxing.mou@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 9658A1D6B87
X-Rspamd-Action: no action

On 2/27/26 8:05 PM, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
>>> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
>>>> On 1/12/26 9:25 AM, yuanjiey wrote:
>>>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
>>>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
>>>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>
>> [...]
>>
>>> Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
>>> dpu_runtime_suspend, then we should be able to also skip setting OPP
>>> corner in dpu_runtime_resume(), because the previously set corner should
>>> be viable until drm/msm driver commits new state / new modes.
>>
>> That matches my understanding.
>>
>>> The only important issue is to set the corner before starting up the
>>> DPU, where we already have code to set MDP_CLK to the max frequency.
>>>
>>> Which means, we only need to drop the dev_pm_set_rate call from the
>>> dpu_runtime_suspend().
>>
>> I concur.
>>
>>>> For MDSS, we're currently generally describing the MDSS_AHB clock, the
>>>> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP
>>>
>>> No. As far as I remember, MDP_CLK is necessary to access MDSS registers
>>> (see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for MDP5
>>> platforms")), I don't remember if accessing HW_REV without MDP_CLK
>>> resulted in a zero reads or in a crash. At the same time it needs to be
>>> enabled to any rate, which means that for most of the operations
>>> msm_mdss.c can rely on DPU keeping the clock up and running.
>>>
>>>> table.. The GCC clock is sourced from (and scaled by) the NoC, but the
>>>> MDSS_AHB one seems to have 3 actually configurable performance points
>>>> that neither we nor seemingly the downstream driver seem to really care
>>>> about (i.e. both just treat it as on/off). If we need to scale it, we
>>>> should add an OPP table, if we don't, we should at least add required-opps.
>>>
>>> I think, dispcc already has a minimal vote on the MMCX, which fulfill
>>> these needs.
>>
>> I have slightly mixed feelings, but I suppose that as we accepted Commit
>> e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the domain"),
>> we can generally agree that it makes sense that calling genpd->on() actually
>> turns on the power indeed
>>
>> What I'm worried about is if the clock is pre-configured to run at a high
>> frequency from the bootloader (prepare_enable only sets the EN bit in the RCG,
>> and doesn't impact the state of M/N/D at a glance), we may get a brownout
>>
>> This rings the "downstream really did it better with putting clock dvfs states
>> into the clk driver" bell, but I suppose the way to fight this would be to
>> simply set_rate(fmax) there too..
>>
>> I attempted an experiment with pulling out the plug. MMCX enabled with the
>> AHB clock off results in a read-as-zero. I tried really hard to disable the
>> mdp clock, but it seems like the "shared_ops" reflect some sort of "you
>> *really* can't just disable it" type behavior (verified with debugcc)
> 
> I think, in 8996 it was possible to disable it. Not sure about
> 8998/630/660.
> 
>>
>>
>> There's a possible race condition if we don't do it:
>>
>> ------- bootloader --------
>> configure display, mdp_clk=turbo
>> ------- linux -------------
>> load rpmhpd     |
>> load venus      |
>> set mmcx=lowsvs | mdp_clk is @ turbo
>>                 | brownout
>>                 | 
>>                 | <mdss would only probe here>
>>
>> *but* that should be made impossible because of .sync_state().
> 
> Yep, sync_state should prevent MMCX or CX from dropping under the boot
> level.
> 
>>
>> This may impact hacky setups like simplefb, but as the name implies,
>> that's hacky.
>>
>> Relying on .sync_state() however will not cover the case if the mdss
>> module is removed and re-inserted later, possibly with mmcx disabled
>> entirely but the clock not parked at a sufficiently low rate.
>>
>>
>> TLDR: reassess whether MDSS needs the MDP clock, if so, we should just
>> plug the MDP opp table into it and set_rate(fmax) during mdss init
> 
> And what will drop it afterwards? MDSS will still vote on the MMCX / CX
> level even though DPU will change the clock freq.

That's a good point. Perhaps the easiest resolution will be to leave a
comment before the prepare_enable() explaining that this should have a
vote, but it's easier to rely on the providers' .sync_state() keeping them
online until the consumers fully probe.

[...]

> Let's go through them.
> 
> All SoC except those currently supported in DPU require SMP (shared
> memory pool) support to be ported from the MDP5 driver.
> 
> Most of the remaining platforms (except MSM8994/92) also had HW cursor
> implemented in a fancy way, in the LM rather than in a separate pipe.
> I'd really like to postpone those, possibly first completing migration
> of the other platforms and dropping support for them from MDP5.
> 
> 1.0  - old MSM8974
>        I'd rather not touch it, it had bugs and I don't have HW

I have reasons to believe msm8974 v1.0 never reached store shelves.
Let's remove this.

> 1.1  - MSM8x26
>        Probably Luca can better comment on it. Should be doable, but I
>        don't see upstream devices using display on it.

Because there's no iommu support for these

> 1.2  - MSM8974
>        I think it also had issues, no IOMMU support in upstream, etc.
> 1.3  - APQ8084
>        Had hw issues, no testing base, no MDSS in upstream DT
> 1.6  - MSM8916 / MSM8939
>        Can be done, low-hanging fruit for testing
> 1.7  - MSM8996
>        Supported in DPU
> 1.8  - MSM8936
>        No upsteram testing base

8936 is 39 with some CPUs fused off (unless you have info suggesting
otherwise)

> 1.9  - MSM8994
>        No upstream testing base, no MDSS in upstream DT, normal CURSOR planes
> 1.10 - MSM8992
>        Even less testing base, no MDSS in upstream DT, normal CURSOR planes
> 1.11 - MSM8956 / 76
>        No complete display configurations upstream

+Marijn, is your computer museum still running?

> 1.14 - MSM8937
>        Supported in DPU
> 1.15 - MSM8917
>        Supported in DPU
> 1.16 - MSM8953
>        Supported in DPU
> 1.17 - QCS405
>        Zero testing base, no MDSS in upstream DT

No upstream MDP5 support either. And it doesn't seem like that SoC had
much uses that didn't end up with the thing glued shut..

> MSM8994/92 would have been an ideal testbeds for SMP testing, but...
> they mostly don't exist (please correct me if I'm wrong). Which means
> that the next viable targets are MSM8916, MSM8x26 and MSM8956/76. All of
> them require SMP support and don't make sense without cursor handling.

We can think about poking at some of these it one day, but certainly not
high prio..

Konrad
