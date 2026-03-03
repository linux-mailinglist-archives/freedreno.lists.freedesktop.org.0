Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMJGGv2+pmlDTQAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 11:59:09 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4351E1ED352
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 11:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E11510E7A2;
	Tue,  3 Mar 2026 10:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0MPB9ik";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdvloalV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111EF10E795
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 10:59:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239n6Z4582424
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 10:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ky4H+RDAuV9lnhfu4+vFh1Tor51oZWRRpkphH7w+Ub8=; b=Q0MPB9ikSElX2h/U
 WcFXzQkKr8VyFAKp/jvDA75uXu2sLZ4iWT0fIt0eX8XfgemnCPll9uswnFo8eTQ2
 wTqG4WIj8BzkTp/fEOeBsOZTJ+qsEF21L9y6gYgVN7GsHgCZzgIxi1rgMHu/ilHu
 61WcIlBTtHBuoXcO9yFJ898PpxWD4vPt6JWOZLxA50H42u4nhQN8LcpGfh3rlPmi
 /cCHgBtA9TqfmIA4fjvXBbrtsfj1ehBfdJLNYzsxXV0xohcNRn3fGEkbGUadQGrd
 2RmjV3lP/2xCXRTEAYHyOj53fDCOCwSfvggaDCNg2pLCR7h6KOdzE1RdTwdrjyOK
 80MGLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnh6uanq3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 10:59:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-895375da74bso49404996d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 02:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772535543; x=1773140343;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ky4H+RDAuV9lnhfu4+vFh1Tor51oZWRRpkphH7w+Ub8=;
 b=TdvloalVkOFQB0u9k+De8PQOR1guiLjkagzJDdbYS3x4JGpk6TcQRXpndihmwCLr6V
 9Ghp4hvQT90cN38JLREDEVZwA4Fs1rGJPOhVtIGoT1NfcvCqFcUxbji0EwLQTuAXFNgC
 TqzCKgX+Fj3YPAtTgnpXCsDCqupb/d9fMFyGQZlWgYt2ypYBmlr8JZwquAuNhe4Gr6TR
 tcZS6CCSdxdyQzXHwUA31Xll/w3bx8BL9qLHttb8ljXdYw8ZjnVJCgeiS6s0W1fjOaQF
 I4GJ6SPUUQC2W+JYqi26GDtemF5Czq+UYDcSlCEtpxvxfCZVXGTEJCPd+97t1MYfqPBx
 YC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772535544; x=1773140344;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ky4H+RDAuV9lnhfu4+vFh1Tor51oZWRRpkphH7w+Ub8=;
 b=PonYF2ZGBwN1K37el3aRMDbGfIBm6+oMRXq3TgHHjylZTYKFH03g0igFgtqxvKVl2H
 HPTMcUGvVoPADyhs3G+vuogNqulxqqA/0AnG1p+TJI1/OUi7LvPhfU7dSSb/ktq+t8Cy
 RKMVbxOMnQ4HHMFNjI7AGc7e1VtiXzH/Qlgs1vfif4JloIwfJbDBebwBZ459fajkD0Uh
 43qkZmBJZeo30c9KJi0TiuZBEEpru9jNHAYLvGtCYn2ZOJsvRZXZ2RRL6iV45oPrE0Qc
 9ChHaGpDlg8ZI/YVlqmF9Li0vEvsUz9OnRe/p5cYuyr5tBm7auUoBcN1zGxA72Pp4esd
 ohbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzph2A0mMVKCk7PBVl5M5gyJvVyXwllxb4b6ARVzftQl9JVoCoFbKsqG1jDij6SOrgc0rqDkBN8d4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz++vVM0kLYdY2O+maohBrFBBj8XqbgYws1m8ktXjcYgPgkCuJG
 L6LuQ5Eiizq/cUVnO+DrMNP1jGOun/nHofBvIIyVQ+3MGnYWaiPbddgDyMHM/VLI/ACe9Xu10Ph
 ZaxgI1yJrsgC/NTaoarNYO6HHLwGfcVMY4X+tceAq8Ij0e1rafay6OtP2CPxQemW1hXTqdE8=
X-Gm-Gg: ATEYQzwkWLYaM470wOZLPs+rjKjkw+51WavjFzZm+fM+UPZXOSK1CqgoEywyK5V0g9c
 zk8Fyn6ZD466UzTi7ekQK9J99Vhute0/qVQsh1jYUdUD6OlQtqEiUB0H3Cd7dUCS5sqwcZxFa3G
 jF5UClMxmfsz1WTZRgEQVuRHVIHb783/SpTZrrIsMrzs/HhdKGHHk8kJAkkIAh8A3AtROCi41or
 uUncBnu1x7yPusEWWigqwJuXM2kFfhKeX0a4BvFvlxW6zk42u6scgxV8rCKrx8Uy8wRmRw5Rscw
 Q/2P3tbJEe7plAgYTI4eqMVsgKPzX+SKBoc7JhuPM+IwZBBI3CqJFKeATyd1+USjPWkgcoC0YcO
 YhsWepf/Iu0iadT2hPPUw4i1LksUCcg9Jkf3n1TkpIE2KmxvLCaPaLVhkGJV7eKHFt2ZazneTRm
 i0t0Q=
X-Received: by 2002:a05:6214:3490:b0:89a:842:32b7 with SMTP id
 6a1803df08f44-89a084234a3mr24645226d6.2.1772535543688; 
 Tue, 03 Mar 2026 02:59:03 -0800 (PST)
X-Received: by 2002:a05:6214:3490:b0:89a:842:32b7 with SMTP id
 6a1803df08f44-89a084234a3mr24645086d6.2.1772535543154; 
 Tue, 03 Mar 2026 02:59:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ac546ddsm583723866b.20.2026.03.03.02.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 02:59:02 -0800 (PST)
Message-ID: <ebc0b989-369d-4535-9398-fda2fc09e5b6@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2] drm/msm/dpu: enable virtual planes by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4NCBTYWx0ZWRfX2z8J4TS9EFtp
 GeX6giBOyu2UGPQQYM2ZhiteefndI9oSSYMCyuvralkf0h+Z9iyjAbHe5M4yYnjdscKZPd2kLHG
 hbGSp0sNQG66oqD7rp5NO2MttBcoMkEaBSvF7k9k/OsRhs5V+m1Fm07t0VB29VTIvSMBfHHNEjc
 krJyeUkXbCmQ9aBE/3GDHhwiOsbesuXwnldM94+sZro5plEpEphloVfJQ2bv1/+m2z1jI5CwZrN
 spn9NrsvJjMVyBcXCROLfbjdbqRukMH2dXqOQndfS50DDT30aJuEtLuYvdeDjvcfSAnmuAZbZ5y
 Xt2EBWjPmraQt7CSrO8oOn+XSzJpKatLABFXxnVd9RQke7S5s1grpGmVNnqEzECDyxQLHzKO5F1
 Oqo36O/1WYq0Bm+hAxZO3xbdg1HS0sxg9TxLNa0ntt3cf73gsB2Ap8K2r/FZ405wJnRypLIxTqM
 aQqvlK8VLxn5P7DPeBg==
X-Authority-Analysis: v=2.4 cv=MuhfKmae c=1 sm=1 tr=0 ts=69a6bef8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OTa4uPH3y4hw8luG7FAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: KghMGS-d1lOVVzvnh4aMj39PpOxlI_Je
X-Proofpoint-GUID: KghMGS-d1lOVVzvnh4aMj39PpOxlI_Je
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030084
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
X-Rspamd-Queue-Id: 4351E1ED352
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,quicinc.com,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On 2/26/26 2:49 PM, Dmitry Baryshkov wrote:
> Turn on the switch and use virtual planes by default, enhancing
> utilisation of the display pipelines. It is still possible to use legacy
> implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
> parameter.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This is being sent as an RFT for now. Please give it a test with your
> compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
> the switch for 7.1
> ---

No immediate issues on x13s + sddm + plasma-wayland

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
