Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG+hCvfArmmKIgIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 13:45:43 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FC723916C
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 13:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592E410E181;
	Mon,  9 Mar 2026 12:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9lrZbJ5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZosvZHo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE0610E181
 for <freedreno@lists.freedesktop.org>; Mon,  9 Mar 2026 12:45:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629AnBTL1565517
 for <freedreno@lists.freedesktop.org>; Mon, 9 Mar 2026 12:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 meRktTehSj6qBj9CkXJ7Dg5Ap2sMKM0JeMCDAVB3Dsk=; b=I9lrZbJ5xuE4yeYj
 H/sCiQNl0nUfZpgLWT9JqRELJ07Hcm9WuzxYVQ4Dwdz7LUe5mq6TknrmjiCgtnvs
 0vBOj82WyQh3TufzBVbPbew0ajciS1IKiaLww5aCLY8CMdJ4iTyvPufe3KbB6ClJ
 ffjSdhD+4VOW1V3mKDeKH/mYzac+1mn9kyb9uMc52GemP9Fn4AU8p4VnKbL/4eWi
 ahQttQGO03n84ESAbT2v6eEIvl4IFlEld13wjSOqjLlDxDPUydUQqYUWpqkX1vGo
 i1jeucpxKpHYr58fz0cgeuOKaUXi1HF4WTVduUJNKYWywfxihXKdkNCQGC20IjFr
 Ip4pXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qewr8q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2026 12:45:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cd8dc8b434so41205685a.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2026 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773060339; x=1773665139;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=meRktTehSj6qBj9CkXJ7Dg5Ap2sMKM0JeMCDAVB3Dsk=;
 b=FZosvZHog8yK0rpm0BXxVVFZwgOHTE9JQUKNruWkkaAobB7ilW5wKSN0j+81Yp7jIk
 h2yoCBZqWVB/RK1LWB5ksY0qwyN9sPFKCNhelJTqC6x4EvjtPttlRd8cNh3wtOI4zjUw
 mMrno9jdTE421LahNHxKIZR+kgD+pVJHLcADcP3WysZkQftoW6TlxRIOVFFgiH4QllkS
 u1H0XRjw+BJNwvHU+7gdOsI4RHPpzGljHJtrHHFfWjpmcbp+ffUdVcvVKDxoqBN0dxH+
 dhXVyCWi9FOKCe77qT/WK2qNdd8wtuISqzMKmloCHEeMh4DkrjDiLwSaQPZDB5fKTGYl
 /BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773060339; x=1773665139;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=meRktTehSj6qBj9CkXJ7Dg5Ap2sMKM0JeMCDAVB3Dsk=;
 b=vslv4D2YuOAitBLO7cnu9ldsdlu5LBgTHrISjNF7irPkfSfz7dB+tLRGkEjiq4INNc
 McHHMj1Bp5u/unlgOkBYrhNwm+S7jeGS4OcdZTGbAsxo8bb5jc7wn1MA5XytdY9SxvSe
 PylWiENEtSvYaVskhJYiriVL8SvK8D7zrV8+mIXBSa95CJpRSb2ADwwnO9Cz2JmB3Pt1
 T1XyUT9+Ta27WlQtzEkqb5Gc+BynPsfkn7qjOUGNmrLIpykORWaOWwQPXGEe3+wRwrU+
 fLBA2goEt2zTRtESoQay5CH4IVNfQdpzD16+Qm4ryC+DGq3ycTdnzuJBXa7GR3XdgQbV
 czBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPn3zv94lrJJzAmGslvgM56M5fLRPHtx6niiUk7eLFIE5CRjHiqy/vKsWTO6KPl79C4wEMQa9Z6Ps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLatI8M4WOWYPy2YJy5sTvZvVVJgyGSxXCmqwILlWE6fssDWpg
 XkF9Us21UVl+pIDROVHYU0f+lBlRwEGYtn0z7OBX4xCqq3q4Jm3Z5UNO7h9mQ4raL3zWH0gpwW7
 gradsQfIISRW+QyfBmmC4DmFUVK8c1j7Z+pkZA+11ACB8LfhozRvKrwG2CDpC+piKbMQahxA=
X-Gm-Gg: ATEYQzyKltr1yIwjweiurdHoiY/y6658raL7tP+V8H5Z1a22zJPTHrFlr0SEegJ9QLn
 dUF09/Ccw//L5rO5TEf2JcgPdTbZZaij1J0SKMECe2M1WX1N5+iKFw3JQRTWSIihpFZfR7ZbQoW
 87mKc18FP5mN2r7k6Gc/LGimVOpIx6hzPoR4MwNGI+vXXjuuMalkBaPZEVoTzThXe1ZY8fKGXdj
 siPqE+CtSoIHtYTVjzGR6C+15xrPWVPyK+VL82NZY92h/C0TckQtAEKPfxjGhSHRWewxpQK874n
 WLxc+yAR1T27AZaYoeOepS/dF03Azw7bI1hBkXg5ymJvV2xsiPvSx7mEjba23adEVmFCSecZJ5k
 dOS17BZlHefPBE2SA/kS9BHofcOx4h1Rxz0IGyzftmmB8o714B90PMvb6Ymwg8+JhapTPC0fGFW
 8LDRk=
X-Received: by 2002:a05:620a:1914:b0:8cd:8751:2b19 with SMTP id
 af79cd13be357-8cd87512f16mr364078585a.7.1773060338682; 
 Mon, 09 Mar 2026 05:45:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1914:b0:8cd:8751:2b19 with SMTP id
 af79cd13be357-8cd87512f16mr364075585a.7.1773060338133; 
 Mon, 09 Mar 2026 05:45:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b942ef8c95csm356164166b.21.2026.03.09.05.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 05:45:36 -0700 (PDT)
Message-ID: <f1e77005-8af0-4628-87ea-b38263418bdf@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] drm/msm/dp: Drop the HPD state machine
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I_tU33UJiR__-jBDvtVH8MxvWrHNPa1e
X-Proofpoint-GUID: I_tU33UJiR__-jBDvtVH8MxvWrHNPa1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX3aITKuXcqoFz
 qygM/lTGzBFryBGECvPbM7Oh4PEBSRXlMVPrPnByHOJaGusGqWAC37G+e+moL7FPQIIrfl4qJGw
 SCwh3rxGtXCT8CkQi3lnHNwEnWpj1/91lR19EoXp5eJh4Ynj3sUUbv9SsTtqKwVGQWjP1hik6jl
 xWIlmbdL/l+0sz0v4xLkVgvVKHrc48HoTAaI4b/3jmXzE1nUwC2Xr+mw2xpIwcIMM8Z1HWCVwA/
 TAgXorpBJ77QdlrJWogyMj9L/cBvnHoGuFJrgwgVV7rllfZkdMPdLg3/vLq1bGJP74exL2pXNua
 Lj1CZy375edAkZzbs5gsiPhKjCYWaiMuwz0nzz1pcFbjiRggOiCJnGmHOMEvID//WXiUJ3yrnSO
 kQBiGFqSYTg2Df+ebUdnF7/Q5XXm2iw/lRy1P3+Q5OoSjCHmxpmiQ0tMienzeCCe1rDEEsEAojU
 Ci5P9Idexe06g8CAfFA==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69aec0f3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=9ZUI4OZNt3IswVLbaQEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
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
X-Rspamd-Queue-Id: 82FC723916C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jessica.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/5/26 3:30 PM, Dmitry Baryshkov wrote:
> Currently, all HPD interrupt handling must go through the HPD state
> machine.
> 
> This has caused many issues where the DRM framework assumes that DP is
> in one state while the state machine is stuck in another state.
> 
> As discussed here [1], this series:
> 
> - Removes the state machine
> - Moves link training to atomic_enable()
> - Changes the detect() behavior to return true if a display is physically
>   plugged in (as opposed to if the DP link is ready).
> - Remove event queue and move internal HPD handling to hpd_notify()
> 
> Note: eDP is mostly untested. This will be sorted out before the next
> iteration, but it will not affect the series in a major way.
> 
> Note 2: there is an issue with the DP connectors using GPIO for HPD
> (rather than using the nativate DP HPD pin), the DP will not detect a
> display if it is plugged in before the board is booted. This is not an
> issue of this series and it will be handled by a separate series to be
> posted today or tomorrow.
> 
> [1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
> 
> ---
> Changes in v4:
> - Fixed PM runtime handling
> - Fixed several cases where the HPD machine would loose its state
> - Fixed the case where detection was ignoring the plugging in display.

- forgot to run b4 trailers -u

(no worries though)

Konrad
