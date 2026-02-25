Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABQsBt3AnmnsXAQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 25 Feb 2026 10:29:01 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7122D194FE4
	for <lists+freedreno@lfdr.de>; Wed, 25 Feb 2026 10:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ADB10E72A;
	Wed, 25 Feb 2026 09:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="noe0ugw2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEgjlZrL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1AC10E72A
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 09:28:57 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9SCID806795
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 09:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y0rSTNHrb7cMCGYYM8naR9bjvD7jQUjTiqevbIkkW84=; b=noe0ugw2ojIXxQdJ
 6XGLle5/klBjdpbs5FfTHOP62cJzb7ZJJYJYxlAdzbS2+eeaDzl+PcChB/9ar6YN
 Xr8+D4qVTcbrSqcWlXkFOQPk8JksJ7VqAd8CGKzxSzRaJEYIDIEnlTW6Qgfl/x+X
 u26g7lmLOW6vfPrd9JJfl0Mrniu7PWzeKTI07VNfDMtA/5lAP0OE2DElwnDa1nA7
 z6y6IH7hqtuIS/eepQKz3MGIj/ZxXfrZ/71worXXwKIAkd1C1gsMLvAnGWEslQNn
 /lOrUNAu+EoovTdYaNb2xgInXk/XrcHZiK0Ax+GRZFuNzBkrWF6y0B3zGxyNf6oE
 aENh1g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5p93pj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 09:28:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-827185c410dso4061579b3a.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 01:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772011735; x=1772616535;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y0rSTNHrb7cMCGYYM8naR9bjvD7jQUjTiqevbIkkW84=;
 b=DEgjlZrL9mkF/BDybVNOkdNiSK8sQyIfB466HbArvb71Vpki8R7VKyAlWzttUWR6pQ
 k09cYVPVopNgEloAOgC1s8IxOIFbWyG14Fchl4Y11UZCIsT+Q1LxPFDfx9pxVqRqaRvV
 2Oj3mqhcYxXvmz3i3s9Rq5gi7O0U1ObOPD93DqjBckFu/AkNZmn1dS/lHjqoA1uUqfMF
 dJCm2/TNR2AoNLiwelchQhaY/5yr9Or5vQU26toKK9XxiBQkJ9SbM0MbUVIiL+Qvi6zd
 DRF5HH8RjWDY4YVn6ldUCbGcUnDnRrU3keeZUVc9yDthgbEITEXc2wSfylC7GplX06VO
 /QxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772011735; x=1772616535;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y0rSTNHrb7cMCGYYM8naR9bjvD7jQUjTiqevbIkkW84=;
 b=QGfYvLxsbDRuaG2Y7E2oZECCAquWZ6lv/o+G5wYmXdd8mfAu9zhU8XiBXao7cmQYZJ
 OZwLNzM94An9nQn2roAGOFuFB/NLQIUkSPjdGHm3Y2+zwe7vN57OOVCzymOnwYCQ1N+9
 AgEHtftz9u56zT4IN2Vqj//CQ+EZqZdqguPuSQWHRu+yAYLu0skmvvex/Zwo+vHVxlKl
 G/sTk6iDPZ02vwRJNt89wZj2Emm8mfQ42lp3kCLVM5xgZJ2Cdr0r+sGclRJKP1g4Htww
 yoNf2QkagfLP3iLY4O9oVlWLwwd3/pskIsbvFs1IWWlerrEBKd1GyixEbkawkvE4gweA
 gUVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtTgwBi4LLxEwidLWG94HYyWi8RgaWLPKjNFS0PpLHftT7jJruXVIik+QaAkJSBgiEByJ3X6ISbTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpeLrnCGl3EE11AeX56Qg3EN05FI6Tbh2fVl7pTun6kNxl2qv+
 JVn9K0Fma4WhfXHIhn6O5qU4Sz2l+07JGj6YHgdJHhAOmkd1cvblVKFE94DX1ScnaL6mMfiuRww
 WeLzim9W3tM6iB2tfhw4N9CcgYS97O3laBIXXqzmVmw7RKStJJ01TJLLD5HJ6rivgwEPH0ZI=
X-Gm-Gg: ATEYQzwcVcrgBSb/OIUD8twz2KrO8zV58VS09T1QwyM6bSbtL1Px6wLGP9Ol0ZfzcHm
 l4HTQB8TDmhZHa630yNdMGMg/cvgAf9jhqsereR/wlt7UcaAq6XWiNWM91mXdzCHzewlTMLXlWU
 nJxoTfxkt+x1tvL1DB3wSYK7EnA2lKrhdpfaHzxNHBEmhc7Rbt6yB95wCWK6iIrdzFjG/ry6Tfz
 QnAgiO2yxUqQ8m+wagfRkEsrV9dY9LNaDroe+LgLMMawm4EeoDJq3o/Sp8kXL0XCSeIyWkTcp3q
 7/aD25K0KFBBN9dTpaYf16/tOxzCSdr6v01DXoxkePRMqNdof7IE9o8HGzUTKMfDE2Xk7+x0HNB
 upMWaeW9nSl1H5inUeveVRDXr3WMwuFduuBBC8kRLpoJM574qBQ==
X-Received: by 2002:a05:6a00:6d49:20b0:827:2c87:9485 with SMTP id
 d2e1a72fcca58-8272c879ec1mr292171b3a.32.1772011735309; 
 Wed, 25 Feb 2026 01:28:55 -0800 (PST)
X-Received: by 2002:a05:6a00:6d49:20b0:827:2c87:9485 with SMTP id
 d2e1a72fcca58-8272c879ec1mr292148b3a.32.1772011734794; 
 Wed, 25 Feb 2026 01:28:54 -0800 (PST)
Received: from [10.204.78.182] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd8a1145sm12759019b3a.45.2026.02.25.01.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 01:28:54 -0800 (PST)
Message-ID: <5fc6f252-a161-4deb-b88c-da7729f5a8f7@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 14:58:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA5MiBTYWx0ZWRfX+JUfjS9ZOLRx
 FOwmI0Lmy9PN2ZxMaWHpqentmmS991edDXQ/ccHdQSErX3s8Q1zacfySUk/gAKGehkQdiOnsI5p
 qwxobgLmbbXD6j667Tuvw6qQ2e1TssJd3FnGGY6Aid2Sk+uTKAIXcYb/sNyLIRGeCzNwm/o+kyg
 peDDk4sTWhT8ZFUrly5BE0rYy7CNFOffpVfW3e2v6MRUh+B9iD67Rlm8nw7dWL9cUI72M26GNNf
 ZL8QZGFc9F7cJGmz4rTNLeUyJdMIvFsBogU22TYMpRDTks3C6ZAMMLDORiRqf9bUcolBaNxmyBP
 0k7EDB1I6ZL4YpyiaMByVnoRUcQApJbt/yQurlzZh/F52aFyS13nQjutDWd2MgTPE4o9qThC/dU
 UuE/r8zxxpCz4IKSTsmM+k1l/GQ0aFaFaLAae916m7z6B3Jjb8j0k3gS2jJ+8BwSXznDQzkZhEK
 ltYG8NGYjgQOKtt+vTA==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699ec0d8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4FoVbHgPJPfqMihqj2kA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: BMPLKnjC16t7zsmV-5IYpvkhBOGXHNaU
X-Proofpoint-ORIG-GUID: BMPLKnjC16t7zsmV-5IYpvkhBOGXHNaU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250092
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[mahadevan.p@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7122D194FE4
X-Rspamd-Action: no action



On 2/23/2026 2:02 AM, Dmitry Baryshkov wrote:
> On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
>> On targets with multiple display subsystems, such as SA8775P, the GPU
>> binds to the first display subsystem that probes. This implicit binding
>> prevents subsequent display subsystems from probing successfully,
>> breaking multi-display support.
>>
>> Enable separate_gpu_kms by default to decouple GPU and display subsystem
>> probing. This allows each display subsystem to initialize independently,
>> ensuring that all display subsystems are probed.
>>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>> Depends on:
	[1]
>> 	https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
	[2]
>> 	https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/
> 
> What exactly depends on this patchset?
The dependency is as follows:
As we separate out module loading of adreno and mdss with 
separate_gpu_kms=1 autoloading of msm.ko fails. With change [1] on 
bootup, msm.ko is loaded and gpu card is created.

The main reason to bring this patch here in upstream is for enabling of 
dual dpu configuration in Lemans hence added [2] as dependency.

> 
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index ed2a61c66ac9..65119fb3dfa2 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -54,7 +54,7 @@ static bool modeset = true;
>>   MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
>>   module_param(modeset, bool, 0600);
>>   
>> -static bool separate_gpu_kms;
>> +static bool separate_gpu_kms = true;
>>   MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
>>   module_param(separate_gpu_kms, bool, 0400);
> 
> The patch LGTM, but I'd prefer to get confirmation from Rob.
> 
> BTW: have you tested it with X11? Are you still getting accelerated GPU?

Yes, tested today with X11 app(xterm), GPU rendering is used.
> 

Thanks,
Mahadevan
