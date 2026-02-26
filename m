Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DncD9b1n2kyfAQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 08:27:18 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC9B1A1D85
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 08:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463C910E142;
	Thu, 26 Feb 2026 07:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HeOt6UQy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMRhbRvg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C976E10E87E
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 07:27:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61Q4V1Aa2617845
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 07:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G4I4m6RsEMahKFzP6p9o5hUH1KY7xoCXb1Vmpjga858=; b=HeOt6UQyAN5LvVFd
 JoKCXhQt98PQMHfAX6VeooTuqCf58+WzfbhkTSgcOieyP9fxKFq2WZy2WtQ7sIES
 Cw1nH8t/swlG5cnGN99JV0DHmAtHRELpFdji05pzbrKGc458iX2KHDCiwb6jEWZU
 Jomhy5BaZHcD5JgtRuxiS8+AYMo8y+wi6aKADlSJHCHHtNdL/r6wQe4TasxbmDWv
 bqL/5lnl/DoKXTI3o411QOOC6vWunONK/Svl9axtCEjFBEZ0J8haRbDWgjzbhtxB
 jjsS9YL47sLF2bTLiMTVMNIbLDI2EqvCYoVlpLW/cwcKU99VoZa5Cd5kSYoXyXoI
 DNOphw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559j6sf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 07:27:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2aad3f8367bso6383735ad.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 23:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772090834; x=1772695634;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G4I4m6RsEMahKFzP6p9o5hUH1KY7xoCXb1Vmpjga858=;
 b=GMRhbRvg8xg1KzRxDlLpUQN0SypQeekLi2enEMhm3P2bf+aLqcRSVOYn/Xo326axZs
 Y50LVXiIFrtBCizfF7RO98lXBHzzaqeApqDWwfdqyb04w0t0HmBXuEKfZjOV458sAR00
 oW8PrLIbgqfneVWBot+aEHzKwRaswQeP3XqaKJ/UPqqREdICiT0kid2fUHIgOD2dG8Tz
 C1wb9mtEBun4h6yUSkDM/ZOJr2k272boAFtylQBXVaLxnjM9YIGR53MbkwMdgqMewSnA
 YxR8XqYPqEdJQT0nU4jOltCEL2ZoHqGKRRz2w1ffxLXu6cl5Hd8yPExG07EhjdLNR8lB
 Po5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772090834; x=1772695634;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G4I4m6RsEMahKFzP6p9o5hUH1KY7xoCXb1Vmpjga858=;
 b=RcngqM8INGC/XPKfJMpPSo19VV06TQZdOJji4CmSep2EutSdRTJm/agZXCPhvPRKG1
 qxWb1ZjUvsy9RHhX/W++tLN0iUHSA4/BfLyGk+BX/W0OikVO4kKAOTTp+sqkXtdhVruM
 cIzyAkZYFh/IRHVZi0Qt+ExvP/EVE1ENAACQ/nq9TVJEoOHIKrNXv4pY0KmcwixSX5EB
 DqcnKuRbia2clZ4eNvy1cSEM5aW/CbVhKxiS/AXFWtF7RHdwkhQ0n3K6WLDRdjroSB28
 DWqAXXQNTNa/7bBRi+aaHMZn/Mx5kMc3qoHi4yVqw4yW/SIPRVKqqRagCZvaDdbmn7Il
 l3PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUiGmsX/sKsRet8NUT70fgG/Nxorz3REy7M0Mn73SrRwneqOgbLglF6EeqMv9cicMz93+0Aw1sXMw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXos6VpLzz6cRCZ4py33IskHeF4qw0avaXyOMj0wbC5e4z9Yyp
 ej/9ueDqrux/ghwlY4gljyQBQYR9vv6pt1aED4Zo43g6AjQBGbDCUjmvcz5LWtZtIJStW7oohZb
 eDpaSyOweZMoHc/ZhzIgbE/lbcuqrh6y8PRSJemonkt+P2HU6FmyLLZtekH141sJ7b1XoXYc=
X-Gm-Gg: ATEYQzyySYQtL91dMjx4U5PbavabjpO8+wPW8xZDIREmYXdOBHhHLwnp42T2zC5BRhc
 i/q5tLF1HRcWboKRsUAswosGXHamg7lSwQA9VWM6dXDBvI3XT2qyP1ALU8+/UC6EGZGHoHIXacZ
 181mjefnlka1ck9sGNU0lh9p4J94rN56La4n58gYe6t366pDyY8tMiF+hXJ9mgxjtlri4oGj6Tm
 0iv6RpXKvMlUOg9/2ad4FTHP+mI0g6x254IrrRC0FlhN7qUf5FCsQiYjQ3ulP+XSshaEf0tUAAp
 Uq+s1L7gpPv6ljSeHbUPbPJRVkCLxQtUqWLAJGOZyHo9C5CPPDz35y8PCyFPhFyId7ileKeeuCG
 q1qRoWxd4VFX6i05Vbkj2SI4+xSrHb96OlfF9T50QR0KREg==
X-Received: by 2002:a05:6a21:32a7:b0:394:f5a8:5123 with SMTP id
 adf61e73a8af0-395ad295e96mr3244264637.72.1772090834459; 
 Wed, 25 Feb 2026 23:27:14 -0800 (PST)
X-Received: by 2002:a05:6a21:32a7:b0:394:f5a8:5123 with SMTP id
 adf61e73a8af0-395ad295e96mr3244239637.72.1772090833936; 
 Wed, 25 Feb 2026 23:27:13 -0800 (PST)
Received: from [192.168.1.4] ([106.222.233.104])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70fa82dab1sm1005344a12.27.2026.02.25.23.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 23:27:13 -0800 (PST)
Message-ID: <b18a3caa-bdfd-442b-bc2e-48bcc7c4b0ad@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 12:57:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: adreno_gpu with multiple display-controllers
To: Ben Dooks <ben.dooks@codethink.co.uk>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>
References: <1a284543-9946-482d-a0ce-0d72304046f6@codethink.co.uk>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1a284543-9946-482d-a0ce-0d72304046f6@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -O3z9ZkXqzGYgacwGKsPyXWc_r7YTdFw
X-Proofpoint-GUID: -O3z9ZkXqzGYgacwGKsPyXWc_r7YTdFw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2NSBTYWx0ZWRfX6khnxqX0p09F
 5sPl6QL0eqWPO7bakW99YJHq9n+hT1VoH03U8SGVRHaq8VboIyjJWeoUNzaBhMcjVb+gBHK2VuP
 1II10stld6nve9/eoEu1B0sbQx5hrA+gSMiKbshbWNwrV1dLOJygCh4/Ga8GlBFmiADw4v1EnSq
 tMowsR/idlgQlJMXCI9DERUM+vqgJ2u1g38E2E1MIHOTZSiBvakX5bSJ2/Lta1zSJZAh9eOHDHp
 pJdIGKv1ufFh5XF01NP9vajSkQSOXIZnL9XDvpaTCqvzl+xqhYMhnCMmW6HYIUe4vS+TSaw0iaS
 lmWijqrFxz/39vbyRaA4IyxcTikEmLbptPEvtALEkMnuU44mK27zj+S7xIoUWjDXQt+492VZLu4
 7PirIGvGBcpqrv8CjFy6idpM2BP7PPLHCTMY8TxZ9CvXATq3r6fVCsasglmeRzrjCesst0PHIKG
 abgPyotLFf2WbKgouoQ==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=699ff5d3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=uU6qr6Mq+z3frnNC0vx4Mg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tBjSCWxmnoE_TOf2NasA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260065
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ben.dooks@codethink.co.uk,m:dri-devel@lists.freedesktop.org,m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 9DC9B1A1D85
X-Rspamd-Action: no action

On 2/25/2026 7:52 PM, Ben Dooks wrote:
> I am currently looking at an SA8295P based device which has six eDP/DP
> outputs and thus is configuring two of the qcom,sc8280xp-mdss devices.
> 
> This is failing as the device registration as the first one binds the
> two output channel devices and the adreno_gpu to it, followed by then
> attempting to do the same with the next which fails as the aggregagte
> device code can't handle this and leaves the gpu unbound.
> 
> Fixing the aggregate device to then just causes the bind to fail as
> the adreno_gpu is already bound to the first mdss with -EBUSY from
> the irq code in the driver bind.
> 
> The two driver binds are as follows:
> 
>>> [   43.009894] adreno 3d00000.gpu: adreno_bind() bind as dev
>>> [   43.020697] msm_dpu ae01000.display-controller: adreno_bind() bind
>>> as master
>>> [   43.076995] adreno 3d00000.gpu: supply vdd not found, using dummy
>>> regulator
>>> [   43.105257] adreno 3d00000.gpu: supply vddcx not found, using
>>> dummy regulator
>>> [   43.208582] msm_dpu ae01000.display-controller: bound 3d00000.gpu
>>> (ops a3xx_ops)
>>> [   43.233368] [drm:dpu_kms_hw_init:1173] dpu hardware
>>> revision:0x80000000
>>> [   43.343842] [drm] Initialized msm 1.13.0 for ae01000.display-
>>> controller on minor 
>> [   46.013271] adreno 3d00000.gpu: adreno_bind() bind as dev
>> [   46.024075] msm_dpu 22001000.display-controller: adreno_bind() bind
>> as master
>> [   46.038039] genirq: Flags mismatch irq 243. 00000004 (gpu-irq) vs.
>> 00000004 (gpu-irq)
>> [   46.051349] adreno 3d00000.gpu: error -EBUSY: request_irq(243)
>> irq_handler 0x0 gpu-irq
> 
> Looking into the adreno_bind() it then passes the drm instance from the
> msm_dpu into the msm_gpu_init() and then I am not sure where that all
> gets used to try and work out if we can make the resources local to
> the adreno_gpu device and then have the two display controllers share
> this.
> 
> Is there anyone looking into this? I have posted an RFC for the
> aggregate device issue, but not sure how to deal with the adreno_gpu
> side (and having other hw issues which means I can't even get the
> driver to work with just one mdss node).

I am not sure if binding a component to multiple masters is the right
direction.

I believe Dmitry (CC'ed) is exploring support for multi-DPU systems and
the direction is to decouple gpu and display.

https://lore.kernel.org/dri-devel/20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com/
Could you please check if this patch helps?

-Akhil.

> 

