Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id N8VuNRwGcWmPcQAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 18:00:12 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6719F5A420
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 18:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECA510E86D;
	Wed, 21 Jan 2026 17:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxIJUbuN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIkNidn+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C70210E86B
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 17:00:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60L9pVQm2452247
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 17:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ib7kzlkMpIuGdkzj3jtoMhVY/pgx3vVg09JVTXE93K8=; b=RxIJUbuN5E5tMSZX
 qv64isG/bBFQzWvAci2JxYT0lrGHH4+8mRte9Tmlx97SLRJk4xCKhkRhJrc/4MLZ
 2VQT4rMqYubJL2zuDbX3u9Ksjbe/SA8pZcwuu9s2HvbSrJ824zWUgKfvGgxt176a
 1ezZk3ozn0GEIsVuQCEO/+ktUZ5ozA0V/53Fc2Gi3tXV24tY2397KoOf+T1MuNaC
 i2NqtPq3vFzAvT4KmtEDVakw5ZrKQx2TFLI7+3yc6ItVbt+8B0DfkymY/42xDpgl
 /7Vs9CBP8kD5/lwCETrEMWoBUuFrr/bbfpKfdGBdN7Za4YwEd0/ScWChFsqgtot4
 UlyvKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvhqhd5d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 17:00:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c5265d479dso825285a.2
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 09:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769014808; x=1769619608;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ib7kzlkMpIuGdkzj3jtoMhVY/pgx3vVg09JVTXE93K8=;
 b=bIkNidn+wXA1aBpKfnIuRYTEangQUhrg4vBRp4zw5Mia/FG1+l3eiqymr4R0Vw17oA
 k94zah/tfUQX+q/KGoxvbqET2jElYVGPAcFU2egoty6VQtudG2NBspPNWWKApOU5SiRX
 ShV6KU8HMP4/iTcL04Om8puEImRy0823QPEwQKx4mxOdHJZPAm7LftfXIZF1CSM8W5Eh
 6LwiEsVBhOcm2jdg4j6XtKQK9XKWhxYSQlycb7Nv3fccyNp7fi7pRUE7E1BbyLk7PyM0
 LMokon/bCrP8xIy9mTyLpJakKJjBq18Zy7K0+VhDOnv7y8m3XbBIPQBKwMu7rI1Q1ReG
 IW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769014808; x=1769619608;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ib7kzlkMpIuGdkzj3jtoMhVY/pgx3vVg09JVTXE93K8=;
 b=xBenoU7+GLU2BkY7NBkP9zhMzHo3avdTJaOtfrNSHXS24gNAKT8dSx+1ZNOMgxV+Yw
 4Qb5raR4jItrBo4VITQfBlJPYN/t65mZYj3Ymc4JTc1bb/0nJNJB5SKBWKWjtXtBzHvL
 cJR+tufMcSThXDoT8VERmtBr13cpwNTzWBWD4J3oOx1eXF7pleC7oFMkjxF+P7On95QD
 WiE1ke4xeqt8vEqz1vJg9Uh0C7uPoy6fUtTzHWbq7JIuLyMAjRT9Ul8csn9wZMqoqWZS
 ct7cgVoVo4QNo72s2ePZX30S0sZp1FYBy1vq54eMrU5yz1IDsVRJgCscPxKvmKdFyZr7
 Mlgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmgMU3ahOFzeGLoH89E6yTDItc+Zcr0xQPNdSpqTRWmaA0NEU9V+wIQULMv6LKPyyU2YKgOstxOlc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6n6d3AdJ2HCOlOBIKz24R9IwQNGO7vhl+Dg5INw9FdNnzoeWW
 DFelg8Zb/Gnh9ajcWdwnv53Vc/0kQMn6znN0EJ5MIUQosAGTaUD/QsmpXX3dXVrufyX2/cCopCQ
 FbzSOqS/IFMp2+N3bEE6DYhEbwft1kjd6seoPHkLx+G0wboDTtIugZRIeHaDO0iMPvtS6wqo=
X-Gm-Gg: AZuq6aI8W+drxhKPRYgSI/Xw0+MqQjM8jtWdDU7ulJYauirxn+6BAKE+7/SA9UfvO6k
 EJVjVAZnJHUdPlaSrFsvwe+dzOynIKSUecxa0ALTe1NFF0GGR695u8ZBTFOuC2yWSISmELxk2sC
 pGW4FLI8YHSaoVi2KrvHtBmi1QCl4ldURYgf1FRfcGX8yflJg8sEBd+Nehn0g4bVJjpDXHjW1I7
 hVNg+xMR0CRvEtKKHLUh1WXuRC/5tdv65oitOdWMPxnO1tUeASbHXcvD9VAvCBPcS61yMmONtHt
 kM74wgVFZKsY3gQXgrBg9Jq4ZOm1mBVmXkv8/lisypfLTaE3nhMrehnS0EHoOlrLNVKHAmNs6UW
 dLXYmMfPGSZO8rDjVmfWiFxpp6yXhxqwr/dRDZLfO9N/+nt548HYB2uAGd0zgtQ+hwRk=
X-Received: by 2002:a05:620a:1995:b0:8be:7dd7:f041 with SMTP id
 af79cd13be357-8c6a6799061mr1771910285a.7.1769014806039; 
 Wed, 21 Jan 2026 09:00:06 -0800 (PST)
X-Received: by 2002:a05:620a:1995:b0:8be:7dd7:f041 with SMTP id
 af79cd13be357-8c6a6799061mr1771905485a.7.1769014805404; 
 Wed, 21 Jan 2026 09:00:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8795a192b6sm1582377366b.59.2026.01.21.09.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 09:00:04 -0800 (PST)
Message-ID: <be5d67d3-1909-4a05-a4b4-c9efae4ba911@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 18:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/msm/a8xx: Add UBWC v6 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE0MyBTYWx0ZWRfXzAAtZcoMz4Yq
 h7FG3qnBkJ7oCbJfecznCalk3aY/tCNWmZgr7yirMz8UMOxt5y0D/6bpnQp3hcHyvlhMFJpk0hD
 QTSLjROOy2nfNA7UGZnKt4YxjAz8dswmfrcWeVl330T+syiOChCVlr7nO0q5ui1pFIpB5L1xERx
 2kVnlsY9KpBzIfSvQMexYvicMPb7lLnfbTiJMxn3dQUWgj6DQw/fglddZhW6D6/dJ8Q3BCnwytF
 mx+X5HleOvruoU+fjEwejC/MuiaW514mN2XqhoCEz9MIcDd1nuWOdSUWmXo6cw8TAvqMxm8UQdN
 tf+cLpPUNO6th+ubE3n8GGUJ69n+2FFtniob62EgnTkParT79ERSvOmoFqxjJ3PIMAvIrQuAwV7
 BNqC6sajcuPRdCeo5OjebBFb9xs+eJYRr+u6JqZHN+tEJXD/Bf1dK48lNNS2Uh/jRai78SkQzpZ
 +04aAejOErrcAeiDxpg==
X-Authority-Analysis: v=2.4 cv=S5bUAYsP c=1 sm=1 tr=0 ts=69710618 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=I3w_ynYpeOqJdckr6GkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: rdVzRcA0Aqri8S3gXcWRglG4bmzTLp3e
X-Proofpoint-GUID: rdVzRcA0Aqri8S3gXcWRglG4bmzTLp3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210143
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:sean@poorly.run,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathan@marek.ca,m:jordan@cosmicpenguin.net,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:cwabbott0@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,marek.ca,cosmicpenguin.net,arm.com,8bytes.org,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 6719F5A420
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 5:01 PM, Akhil P Oommen wrote:
> Adreno 840 GPU supports UBWC v6. Add support for this.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> << Trimmed the cover letter since b4 folds it into the single patch >>
> 
> This series adds the A8xx HWL along with Adreno 840 GPU support to the
> drm-msm driver. A8x is the next generation in the Adreno family,
> featuring a significant hardware design change. A major update to the
> design is the introduction of 'Slice' architecture. Slices are sort of
> mini-GPUs within the GPU which are more independent in processing Graphics
> and compute workloads. Also, in addition to the BV and BR pipe we saw in
> A7x, CP has more concurrency with additional pipes.
> 
> The single pending patch in this series in now ready to pick up into
> the msm-next.
> ---
> Changes in v5:
> - Dropped merged patches
> - Rebased on top of msm-next tip
> - Link to v4: https://lore.kernel.org/r/20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 30de078e9dfd..5a320f5bde41 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -276,6 +276,10 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  	u8 uavflagprd_inv = 2;
>  
>  	switch (ubwc_version) {
> +	case UBWC_6_0:
> +		yuvnotcomptofc = true;
> +		mode = 5;

Downstream agrees (and they do a better job of using field_xyz than
us this time around, I'm impressed)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

