Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFN/OlcYoWk9qQQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 05:06:47 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE11B27E3
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 05:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95AD10E188;
	Fri, 27 Feb 2026 04:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WU1fUeuE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KB4Y4c0Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF5910E188
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 04:06:44 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R2JxYs2353274
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 04:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VdQjHF+RYM7rSSLaFwhLHU5/
 U+N3CFTxtk5vUawx9aU=; b=WU1fUeuEZi2nZWztsaD8Isc6submU+vTizHM0Nrh
 ZwEdt0mouZWw0y0gQN2m1K3JLpCqP6kh/QNnbmNW2ToliDbNFZZ2SIJ66atSoonx
 imB7dRoxB9OSI75LJSlhUjcRJqE5sDGLvzP5GU0EAlVxE2T+4TAxk8rIB6S0CYxR
 zE+hG3lu6Ft23SRuROKjVl0i+8wqgyuENgndQ830k9OGdGujdywClUGMkMimVTtS
 54T615IJV5C7wPW5hibVLHFRqpUCp7NmyiNTRhij1JZ2BtLDCcDvmhnPm0RjIIwB
 zuj7I1T/ZfwzGP2YbEjhoAgweMtKbq3stEAjlM0GIvN9YQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u36au-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 04:06:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5069ba5af5bso112839821cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 20:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772165203; x=1772770003;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VdQjHF+RYM7rSSLaFwhLHU5/U+N3CFTxtk5vUawx9aU=;
 b=KB4Y4c0Z355MdTTYZLgMwUukTICC8CuxlgZzcfyhuv5nvgYUJX85gmSTYxUx4n1rYv
 Pc1EqtcaVp4VsD8PUBcFGo2t62q+xwD1C6eeiIZWYhAmUtEEDDeDfUuB3PXupuokji/N
 6gQddfPM7kB9/WtFQr81i6YFl0JLCPC/1YUVcfmK88kJSrzZLyK/KBz/CfsRF+E8tVgU
 MZ/qBEWnhvX3KONcrf5L9GR5ugqKeKHeKadLhnnuar5ddQl34NQk7VYTtR31R5sETlO4
 xenbppyRwERHf8Z82BJN6bBlMWNgwqIREn77eT9/NsPfLDF9qk5WyKikgTZ1gss9XIp9
 ctvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772165203; x=1772770003;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VdQjHF+RYM7rSSLaFwhLHU5/U+N3CFTxtk5vUawx9aU=;
 b=OKovoMso6TtA5eunClYC/Xy7DwUqX470nKEoP/QRa2/HYjlV7T/4PGMoyrYS9G95fK
 u6ZjjaiQ2dF1rOYZ9e8Dfru5ACGL8siFrvgN9BnA25NqfswjLjNitd+jV+YRwe4/HxL1
 SCqFHhqIrNJdaioKoH2zo9pplS3V9155rhdXdezSc0o1hTztmNPyB4XDEdjHHqG83zH+
 FV6yyHthr/AMcosC81E0V7B+K7BZhC8XXXg0zOZCvCVzZZggB0FGOo2PKRuPnphJscD9
 NzaLlKD+O0+G5C9OO10WeU1MLQ7xwGEavCwDpz/7bW/bkG/1RFuQEU9RrZ6sxExFB8ah
 T9kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5yBpispLpYeh31jdeXY012T/upKv6uQTbDZVbdiZe752+juvNt7chyJwiWeEoThw55XEkujZExyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjUsDQ7Vmf64rVqxGMBccbE4lmpZfOyG2Z/En0BIR4kAksxaUK
 0zsPq3DMlOWE5+9FYLfenl2L2Xzac3XzevHxcOVIF+MGIZxDPTBzM3I1cqco0B7qUZ8JMTTvyRs
 QbMAOHzXUectseIuoMFtuTO0RzUnQC7CMe1UaqBZdyW/X1TLkHNXhgt0dyHVq4G8iGZjTnM8=
X-Gm-Gg: ATEYQzyRjOYbMpti8G12EgUpzWb2kdtIR60E1h98XVt1sk1uVXsfBC0ib7OKjTVQTqg
 Vw48Jy8RSBM57WBY45eDfnlXA8SwAM4a8lw0KySfNTuByq/r6nKdzSUiERltisnilNurligYCID
 gRDWeZ/ylUCDrY3Ma4/OZU3opYWUuKWwrdbHgVUbLA6ieyPBKps8c2bz1ETjFSMmuezJWKgVxmw
 BoeT2ZTlSCT0DzWKs+Xfs86P3yVRaY5+XrtysrKqH8F4th1vDsRy8gNu0x1VhXiiHvBcGLr3Bak
 CLhdVWVy/u7cSR1Hn6SUA81VIikQd6o56v62uBAzRoY1k7t0/KJXkYxsxjb7KsTylJdKaBClNjR
 Fvys85q2/LkStZs2ehii5j8sam5uC/pdvzsUSWjw5qkXb/fVUiYrUM8nc55YhCA7OV2tN2F7neT
 0d7i0aTk2RV6ilDz3ArOwsm/fuJ5z7JoqhZPA=
X-Received: by 2002:a05:620a:d85:b0:8cb:43a3:8b6f with SMTP id
 af79cd13be357-8cbc8e1afe4mr166990685a.67.1772165202909; 
 Thu, 26 Feb 2026 20:06:42 -0800 (PST)
X-Received: by 2002:a05:620a:d85:b0:8cb:43a3:8b6f with SMTP id
 af79cd13be357-8cbc8e1afe4mr166987785a.67.1772165202451; 
 Thu, 26 Feb 2026 20:06:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f3016de6sm11487841fa.38.2026.02.26.20.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 20:06:41 -0800 (PST)
Date: Fri, 27 Feb 2026 06:06:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: Fix dma_free_attrs() buffer size
Message-ID: <n4pb4fvxp5toiy3ozrzozml75nkhgb3v4vmljpcx4oyp7kkgic@dhzvtsxhwode>
References: <20260226095714.12126-2-fourier.thomas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226095714.12126-2-fourier.thomas@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyOCBTYWx0ZWRfX2IznySaLRMyg
 2uqsnrzOV7opGL5yRhSlIPqNPnIwdlQT2btqomaYNuEvyGLtMsZlDA3fFMmNSSP0U0mPrt54QuD
 oxdhUi1K6AdWwLgfTI6bipERnZPAAaJxPHbaE1a1rrofiYw3P6HHXoJUKbzfWTgcbr7ETFp/1lI
 bF+0DGdQRFBsPpC2Ty9Z356wThUJZ9Kc+5danqZoP/F7UqNAzkDvyw3isoILlcSxnpiXN5pOtJA
 OVMcF5U/bux8oAOaAStRoNnhHrCgr0RVTZdhgEszDf0JBOmx1BcuA5eVnaIL39H1u/gSa+++kFL
 ZNt++wU+N7Cis3excoOTXbD/cpn9pykV8HTIWHO6Z5umABlHOYAEVHu9vdb38TmSMrAiLmE1Q4T
 jL2WAMDibkVqivenaLbcGuV8lT2Zv7BhvQqAMYJJ190V9sHXqkVMZRdWhQAaltLGgbojAAXedaq
 RNLwsZrUUT60a1Z3cxg==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a11853 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=yVL_GmymfDenR9L41UUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: x8fNp5MTcYc-XOr7UW2jKDKBjoDMfNlz
X-Proofpoint-GUID: x8fNp5MTcYc-XOr7UW2jKDKBjoDMfNlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270028
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:fourier.thomas@gmail.com,m:stable@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:fourierthomas@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,marek.ca,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 1ECE11B27E3
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:57:11AM +0100, Thomas Fourier wrote:
> The gpummu->table buffer is alloc'd with size TABLE_SIZE + 32 in
> a2xx_gpummu_new() but freed with size TABLE_SIZE in
> a2xx_gpummu_destroy().
> 
> Change the free size to match the allocation.
> 
> Fixes: c2052a4e5c99 ("drm/msm: implement a2xx mmu")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
> v1->v2:
>   - Fix subject prefix
> 
>  drivers/gpu/drm/msm/adreno/a2xx_gpummu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
