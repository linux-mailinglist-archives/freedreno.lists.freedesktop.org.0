Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKgUCgsEemlE1gEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 28 Jan 2026 13:41:47 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B88BA160F
	for <lists+freedreno@lfdr.de>; Wed, 28 Jan 2026 13:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B2B10E125;
	Wed, 28 Jan 2026 12:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NW7Cn3fH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7wdUPuz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE97210E2A9
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jan 2026 12:41:43 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60S928fZ811695
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jan 2026 12:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +kKO8dd5rQGlLu9l3bcEKgOh4c+qRDDxzTu2b7/j6A8=; b=NW7Cn3fHtWCkTfEv
 xUSO3e2o/hTeDByXBhngZsPvUM5NT5K1lToWt0WwmVUnbat22ryjdfyHioN/4Btm
 T3P+Z+x0Mwm/bCjg9Q69qsFrReKAf7cyOjELivzRdNMnLkOD4d6J7sX5Fuw5Gs4U
 0xGfeggc9pGR8ctaiUfmExTyn2nY31Mbrv3x0OUjeJx9NYrlWoxj29bfcy9dCLyj
 b6vVomE3dGHYK27i7czbZvbV9d4I8otkxm7SF8qUz2GJXUo3E5piuYGAK2R+7Icu
 pPq3B33p5nSY9jjQVWkqBYLQwR3lveCb7H8ernH1H7jCG9ypSqPEVAXRRB83ZZnf
 mQ63/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbjg5e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jan 2026 12:41:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6de73fab8so213979385a.3
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jan 2026 04:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769604102; x=1770208902;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+kKO8dd5rQGlLu9l3bcEKgOh4c+qRDDxzTu2b7/j6A8=;
 b=K7wdUPuzdRezfExlVonOR61qeqKSh+rI6hWTlizOihmlG8v/ZtIfltIukKrZ3ujvGb
 FP37GHQXCUh+ewfpVNV2RoQsBjpLhleC7bqJBC2ac9+FFGjyrHHa2Hf5uwP5NmeESPBB
 NZRG3/llAMorKYRZFI/dl9ftAKTpLeQVv71huFbhA+vJGO0uxFZhUAjtQBn7syx+XFcC
 dHbYvh9x3opqzMuonBzk5ElR6gzI3TktIM7qR3YCwAEApK79a2M/7WQ8M6Q6L/0tQsys
 v0zUQ7pCdHqhc85aQksm5h4jmrMzqXcGm2NzMZvV0iGyjvEu2r1sf4g7huqFHt3gxySK
 e1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769604102; x=1770208902;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+kKO8dd5rQGlLu9l3bcEKgOh4c+qRDDxzTu2b7/j6A8=;
 b=grS+7/JuUzG/kagxq8jHZSXjMjEe72pjdemXehfjmFpT5JG2AARAc8AQZZ+Rxcv/9C
 330T4eDWLDI8vxxeOTK8icqeKZu2VOl41LnJrlBX79B7VzoeCMpOGpE4syBiMz1WA5JX
 pxInlqgs3cmiT2pUKcyz6uJV4Nyk8/6m5m6XqCbZ2SIwtxrbyFzNs7mR2pMZb7hBqrQd
 DkPIRT6vEI4LUBDpaaD0sFI+3f7BPNP12WQxzlpjX/8j9egQPzys8Q1qe9tjgRMd8tOQ
 vUFxZUX7b3Rkb5eO+FUEGkDeBiZ3s8K7Q8Zl7+MRRAT+RO1Iz9dQrbIcg8BqKEa5kx2E
 96Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWssT/nOaqfr4qK86+5TyMkgCOzCYDUzrYa3np9DIHI99yBmqROJwQs0B1dNdEeZ8BSVCWqxOdDDNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq2cbccI4RFFvbVUJwht+y6vO+BsvuToWjwLd4s9sAccaHMAMy
 +d2cW4/xlcVoHxTf9XQ/grt420kTb1exUj4HwwRY7dqnFxlamD3ZC8b74YiqC9YhwAO/5Jryh6Y
 6ovs3HgkdAxKN9oAkUFELWKYHGF6BO0HM52CuZ4zkEz83fKaT5DK0P8dRzoLvBndSZ4wEyoI=
X-Gm-Gg: AZuq6aLipLNJADtshDaqTduX1IMCBEpFd3Pmwd0NozZslpT/GunEoAqWTjim+PX62Di
 eQsX2BkbLJ+zq9GTl5RrWH0JNa4f3TdRpaulU/k1smiFFQbHfq0ILSVzP5V5c0oBKmq7nhALayB
 9WVZrEZICBXEXP5XIHjMqbas7fpeO54fF/gLtIVSIt2hOm7vICANLl9ws2IzOwB3Rcpte+h2yGt
 Xrtlwpz28s+dLjqqpubew1imqsr6J7kMmSkneJnjmkWSh9oLuXaS6/ovJKeocvyEkPHj81feID2
 Huyz0X/z7X52WdMNNf7ce5fVoDRPbdXr0mtj4+R/noaoOeGUQiXV7/5NVYZwhx21hIH7B/qqQ6d
 fkvRE7J8MTMi27iJ5lWm5RO4/9QVNOj0u6fKpyBaQ+lMCHKG5yZfI6UBUZtj+S+3ndOk=
X-Received: by 2002:a05:620a:46a7:b0:8c7:110c:762f with SMTP id
 af79cd13be357-8c71ac75eb6mr278985a.4.1769604102182; 
 Wed, 28 Jan 2026 04:41:42 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:8c7:110c:762f with SMTP id
 af79cd13be357-8c71ac75eb6mr276885a.4.1769604101707; 
 Wed, 28 Jan 2026 04:41:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-658b469e6b2sm1438238a12.26.2026.01.28.04.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 04:41:41 -0800 (PST)
Message-ID: <795c4862-de48-44b4-9af9-6d9185a3c3ea@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: lemans: Add eDP ref clock for
 eDP PHYs
To: Ritesh Kumar <quic_riteshk@quicinc.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org, cros-qcom-dts-watchers@chromium.org
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, quic_vproddut@quicinc.com
References: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
 <20260128114853.2543416-3-quic_riteshk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128114853.2543416-3-quic_riteshk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c6E2tzESA7GOme_ezCC0y-frKXo8SaOT
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=697a0406 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=3Q2R1SHny_ty92h1eiYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: c6E2tzESA7GOme_ezCC0y-frKXo8SaOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwNCBTYWx0ZWRfXzsGWi6FU8ESA
 QY5Ko4nOX8LF02oL+BhhfwkptiXu7J2Pr8lvgpdpFV1Y2js4KfdEjnDo9AokG4av/W4yloNwCah
 39KF9jEzjInfg6TgmRyfZJIia0636/Hgc+rXsQRdm8zdRwbrkl4weVK3BKf/W1wa0B5PsQeNc0e
 e8gVfCu1YfCaiwFupTp9b0g18Mthwaf0/Btt/mBQJCz3F6PIqKjE593M6p1FJwkBJ2EXOO8yuqc
 xBOCMA6stZN869ZU2VpIjbDcCRLPtOmVFVW0sYhQWNZG9FrTka8Fh013PduZDYdpXInG1Lm5884
 UxChDlgOnIpcKX/TmYDWbsiRHGnjSnfV5FYy7+1Dtz6PDu+nJCJGjoEQudynKKEPVyZVK2EAE6f
 yVDLwitdaRISglxlOZlUX3/wWLojMo0Yg2kTRBc2nR/yLFk+0O1nc1VOUx1twt8H6olTgFVj09L
 1KIq64lv6S0yIu/AShw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280104
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:quic_riteshk@quicinc.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mahap@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-phy@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:quic_vproddut@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[quicinc.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,HansenPartnership.com,oracle.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email]
X-Rspamd-Queue-Id: 6B88BA160F
X-Rspamd-Action: no action

On 1/28/26 12:48 PM, Ritesh Kumar wrote:
> The eDP PHY nodes on lemans were missing the reference clock voting.
> This initially went unnoticed because the clock was implicitly enabled
> by the UFS PHY driver, and the eDP PHY happened to rely on that.
> 
> After commit 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off
> calls"), the UFS driver no longer keeps the reference clock enabled.
> As a result, the eDP PHY fails to power on.
> 
> To fix this, add eDP reference clock for eDP PHYs on lemans chipset
> ensuring reference clock is enabled.
> 
> Fixes: e1e3e5673f8d7 ("arm64: dts: qcom: sa8775p: add DisplayPort device nodes")
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
