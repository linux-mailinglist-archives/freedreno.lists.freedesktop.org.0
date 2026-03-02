Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FC5IRKGpWkeDAYAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:44:02 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F641D8E8F
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD38E10E4D0;
	Mon,  2 Mar 2026 12:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyl5rPdt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heRkltxT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6200110E4D4
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 12:43:59 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6227mXQT2612430
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 12:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VlqArBldRc1YoMwGDMVGPMxUF1kUIY9lZ/UKqUb15lg=; b=hyl5rPdt1kXYfqTF
 SwSgpTQIxmwUeiYFvCVJWYPOVTsnXvjFdNohDst3j377YvuPa9hP4K78GUrvIHky
 tdbb+zuLQl5Sfh6LWrcLGA7JKWPOb6gJ3y5XDxrCoEkGJQ+9Ng/QQkyVZJglf1/T
 ElOS0QxAtK0pg/s+XvItcsiAob2stdEh69IHzjucM/tjZ3YIxSGtUitXKuKvOLBp
 wgriNLlwVVi6VDlDA27hqN0zpk5do8DFW7wrL9HDVMuxHpqebYwQZ6Ahs0CAQMJN
 G3Tb5vAQ7iwJ10BzA2k9u9exnSUt8DdYqqkMgE/h/fV/tFcme/1oDeAqMQf4eYNc
 cdLqoQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbaucgf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 12:43:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb485c686cso389756585a.1
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 04:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455438; x=1773060238;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VlqArBldRc1YoMwGDMVGPMxUF1kUIY9lZ/UKqUb15lg=;
 b=heRkltxToQAqHSFQ3J3aHOPJEzefVOY4yk+n27Yqv8oEdaKJKrNAaUbquizbX41vAC
 mpGV0RPdAPfONgyr9+3+Iva0Lj0j1+3iQjGnr1b/0hwsgS6Y2EWVf7rrwVQJK2/ufbT7
 77ouR7jKypQ6Hcjg6Bc9Vwr1SsAvMRza7et3z/dxzLULdwzY4VsNOh0YgunSqDstxVtN
 qwX8NSUAjaMmx5/0hQ7UelMA/y81cz2paP6k6D1mt+tCiX+TMIEJcPyp9C4Gr70hgbex
 BLAjaRtchgIUKdqOyAkCMfK2yM0W24Dry56DYgxNgNbc7toEHAyfzsgZ63KXabeWDZxd
 fZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455438; x=1773060238;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VlqArBldRc1YoMwGDMVGPMxUF1kUIY9lZ/UKqUb15lg=;
 b=nZ0aXU+MgxV/5wWVouybb+Bvu63AQL4xUGu3t4hFImNzzTmuZOAfAoOht0GweTyM8C
 PoNLYEI+g1KLYE1PHsJkB4j8KzQSWtVK/dwrK3wTnfYQ3SLfT22+aYbhpqXBmQZvhyN7
 yi2+4pWRU36LUS3PSpjpdaFAt46SOXVmU06crXJ8NMp6EXJHgF4gW0wJY8C6jIoUpigB
 NjjUjOLtXtefRVAqnQYQn/wLEEjR3uikE7h7OqxYrHWpuxpdencCRD7P8deV9Dt8JBpI
 shY/x4VhJ8kMooLFbiGa09XicCcBn80zr17W5RyPxmQI6eo1GBf/TAggfbBIPcLA3Czf
 fEtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCpiF9WwGr9hBqY4fCFT9RpNZxfj+CY7MvWCEbogc0DEJTSaFvFYPxDsKq+USJ13swqdmH6LeprEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb2IJFUuURlV9a9PWuXPUzEipDBImDQJDBmkz2ENdCnb68neKA
 T0djqWWpSI4zlftjrUOKSWdCaEOaSEZoNnTckit6N0CDktCUlsq0KF4P1D4hxH8Qq21KDwDYYhJ
 L/N8u7Ypv5RDDBucRsfuNgSA4t3fcy0DTNaZ14z1ssmgH3uIIwsXqgpqIDmvNLoO4haK+oytzy8
 GNg18=
X-Gm-Gg: ATEYQzxmYPB9rnqD7aY6XVAF31Q0joecEr182t+TgxOLiarstncy3TaHjvdutG1ucr7
 eK3ZzvMNDJtXMTsvWGIlAbpxh+M1xDvnW6wOwwRkI5ehXyM0bGFEW3mlG7fCJznmYIUoiS0NEuH
 suc0wlET/zUwjctgXsiZPFzlOII4k/XghopFtuXQQGf9jLqxLGWt71sWabVlFxSZJ4MqRHlphfh
 g3kL8xbF3k8nuryjtP83fohY1zOACtMKmSMFZadavG/WcuTlAfCZP8mSBq3P2ppuB7ZlWivakFk
 9YeN0gvWhjSZqwNGAnZG7rS9BbrXtVqEQY9R7NDdejfmMJrqp/v8Z+zimn1P8k36xqC+nJZ7o3i
 Mi6ftckJEAPXxIFY1r2mgDcs30tBTHaPUjrDKsDyJni7UO3o2g5OdZ/xFFjXGAGTgsYgA4eXrMV
 Cep7g=
X-Received: by 2002:a05:620a:280d:b0:8c9:eee0:dba6 with SMTP id
 af79cd13be357-8cbc8f0b52cmr1028836885a.7.1772455437912; 
 Mon, 02 Mar 2026 04:43:57 -0800 (PST)
X-Received: by 2002:a05:620a:280d:b0:8c9:eee0:dba6 with SMTP id
 af79cd13be357-8cbc8f0b52cmr1028834185a.7.1772455437476; 
 Mon, 02 Mar 2026 04:43:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ac51843sm484250466b.16.2026.03.02.04.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:43:56 -0800 (PST)
Message-ID: <224ef96a-92a1-4628-b377-da9fb298445e@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/msm/dpu: drop VBIF index from the VBIF params
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-6-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-6-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfXwiNuMPWQB0g5
 JM4X7+/gUT6omtgyJYnrGkcC78jK0rQ7ZVHJaaiL3ZaxdiQAJD0GMWnHSP20SDEjYspGvyR3jss
 AnFxTv5v3oTM78mOYiwSUmW4IanQp2kIzlCMrrWEnX4AdSQ65oBc2/Hzl1Lo4EyvmMj+6+YCsZd
 y59VY+aZ69MQkluZQOLiOpopTnvMItyeSQmhOPdr6lk4ElJWGkDMAGJszDbbsCSVueQOY8Fi/8L
 4IgB5NP+lOfCkMPUhB94L7hleufWv0+Ouobr+P3vedJZooidxAe2jXnb85AEAeaqSHldXmHNyEB
 sC8oYAY1MRt1KaLJuq7QpyAw5B1w9utkSFe9P2G4I353W5+HEy6osr+Z1c3i4Cmjws26cAGVrdB
 4dGqu4Rtqu6SdZKjTWWmd4EwGMfj8PJ4e3G+NoPBDWCwixKXQ4RJY52J2dLAzLooPc6zvmZgFFU
 l2yRfZJQJIzLrqk5+mg==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5860e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_hvl8nLCH5BLpogRQO4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 32riY65CaAvAD5XnnyfTpjcAJDUtQLMx
X-Proofpoint-GUID: 32riY65CaAvAD5XnnyfTpjcAJDUtQLMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E8F641D8E8F
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> Since we don't support and don't use VBIF_NRT, VBIF_RT is the only
> possible VBIF type. To simplify the driver, drop vbif_idx from the VBIF
> parameter structures.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
