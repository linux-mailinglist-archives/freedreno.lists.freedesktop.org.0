Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBF8E8bjnGn4LwQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 00:33:26 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973D017F902
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 00:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C32810E462;
	Mon, 23 Feb 2026 23:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cN8RJqsz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TbdojUGg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1B610E460
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:33:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NI3ILX4169139
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xEZRaWaTYLmfpgMyGlakvruL
 p3dxSVDm+gJQSXU8gwg=; b=cN8RJqszRqybxYKAhu3zPVhqw/RSlOZK3MOiyPaR
 n8FNsXTpTOeH8DFgE/CSATNS7Dp63+J3xnlOc5jVpCu8l0i6aBO+9UP3lG8djhZl
 0QAe8X7muxbOM7SluzWZyIOiu2Z1Eo+Bwt4w2dcwCcjxyE+RAibBeIFY/OiJffgj
 1pXEfOficE1oMwVh6C2WKufbkmAqA3Iv3+0fVqsSKDPO8aJdbdPC3DORNt59YSh0
 g4AbkypOHYrhwBgNvX/bqP9eNgq57BdgEXFaAVIT8LbMWBF1KtI3zffy9wnWDw4G
 GKtnWMPjzut45ID61nDr0FiiBC2+s3lx/1JMpfenOXnzyg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgt8mh66j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:33:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-896f96458f3so151010436d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 15:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771889602; x=1772494402;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xEZRaWaTYLmfpgMyGlakvruLp3dxSVDm+gJQSXU8gwg=;
 b=TbdojUGghG5kVaV0zygMe1K6mtR1nDwA1Ss6VVTjuxNWwUt5LQABca5owBxcV3TyXP
 AcRx7BVpoSDomd8prgQ8LzFvAWAQQlxaR4FCaEQa8kvqB6vDW+lJ0G5y/R2YMBqUc0A9
 WkNzC1vg2qpOzuhQ6iPtg/NzFiKDZYdpdHo9qXCYzgLTIs8HApE+oj0Cpcs12cpEm6fQ
 Zd3SVpjCL3JjO9PxLU4cl0cPp56Gof4Lyj/7Aj6LXO+0U5B1ZqIIFOCO09a6ArEdX9yx
 bvYbws5g6dZ/309yfiKj9NRxhiJ96QZPRQI0KOfAHX/lfBhd2gjcQzDn44nUWWAaWI0g
 Zo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771889602; x=1772494402;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xEZRaWaTYLmfpgMyGlakvruLp3dxSVDm+gJQSXU8gwg=;
 b=g3s0jVN03ZYmwI7zbKqCtOSUpWdh3rDOcGFEWp2ZJFV33MoCsce0VcfeyCXtaC/TrV
 xZwGo63RR3a3c2hBYC/UxQglxPic6CWZKL35rbn7pxokYYvAiad3ZfnBOmXUkx+xhoU5
 i45IgEZM9H0CHfCydaK8S2aVJaygO3SW/n9iDAGsWqv5Em6kBJFEUXiW/KKu+vqwEBR0
 gZk+ETByWOP+xHtBiwC89O1+QGeri1Sxg17DGftdGguR3HX06X8GAKcx8H1hclvmFHNW
 ejjGlnFHHr2QWiooYdNB3qwt9ned2y4tihGPZ/AhZK2RdGY6KZLKOW0t0DjuF3StjaZ5
 O30g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUjl7NEZHQSr/Re+Q+gi1jtFHLOLr31MpP0R5XcUyBmnM/JyUnc0315U/PTseOEBOF8fXuStGbelU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfxnin4zFd5AQ4Sig3kBI9rupvlBRMRLCTRkXDJWJjcBJ+0HMo
 SHrfFE6DwTgM9vzgezQ2pXhZQWzKJjV/AKHaDibU7PjKMlX7xv/8pvB2GU3G8CU6PuaFUHCTeP0
 54pfv+Z9I8tC4o52OjzPQ/YMWIhKzFZtcmys2jc1HQr+UhB/F6OwsKkheGr49Ii7AZZU1Y1c=
X-Gm-Gg: AZuq6aIsLrDDteQX+c5kWLs38YWgZ4hfvMJfcfR5Rqsmq06HQjcZBJD0gvUaPePChy1
 60T5a2xKcjJOwfaRfEG94xCIDN1xWsGQwKshxomQnJ8XSETb8zDjBA9WYZt/D9/MwURpGB6a3ih
 xRWr+U08cCSnI5848YZ2tmOjKzU+4OOgTzlAa/oGLrYsshhMWzf/AxMh6v8Cae7VoIntQslc5im
 lg4gyVP0pr1HzzYIV05SXsyYx45cUUIVdnK+7U9bbbPd6fLd/6kt6kaRWYp/FFjepiFzYI1lfWb
 mOo6l7zIRm1h0KX7/Qs/PAAAMdcSCjd95eZMiz3jCgzMmqzaZP1+NLme9nx01jAyeG+BQxF6X8K
 AfHthNGIL/c0hSz/6fzUyiazr7ukhEc59A48RHofCW+eFpeuXUjUezUiGyujL7jgF2WbiMox9Jr
 DI/+zLDcQCg5Txjs9invJbIaRqjTuCVt4KWy4=
X-Received: by 2002:a05:620a:45ab:b0:8cb:4d64:e993 with SMTP id
 af79cd13be357-8cb8ca09dd1mr1373764985a.26.1771889601868; 
 Mon, 23 Feb 2026 15:33:21 -0800 (PST)
X-Received: by 2002:a05:620a:45ab:b0:8cb:4d64:e993 with SMTP id
 af79cd13be357-8cb8ca09dd1mr1373760685a.26.1771889601309; 
 Mon, 23 Feb 2026 15:33:21 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb47617sm1867293e87.75.2026.02.23.15.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 15:33:20 -0800 (PST)
Date: Tue, 24 Feb 2026 01:33:18 +0200
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
Subject: Re: [PATCH] accel/qaic: Fix dma_free_attrs() buffer size
Message-ID: <w537ptifelockziyyn2lufdmkv2puwrwdjnydsyiqn7tuefs3g@lobsudoe33qq>
References: <20260210083529.22059-2-fourier.thomas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210083529.22059-2-fourier.thomas@gmail.com>
X-Authority-Analysis: v=2.4 cv=J/unLQnS c=1 sm=1 tr=0 ts=699ce3c2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=h6-xzC9InjtDQXJTJ98A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: WvYlzB8fs1_NEa0nvNZwvLmtU-DhnT3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwNSBTYWx0ZWRfX2yPiyrFyM/14
 6Lh+r17O0PHje7gP8D74Q2KnhJ1P5zx+Z57u8LZ61OjpTglNYBjEYgSQMCx6p+SHkZsTvjEMWhZ
 dr7kREa5iOmjKUdljisNfHF+LwVBGlCewRwjUSbryTbiPgm+e++HPJz2JGA87w5jNUIuVOej/g/
 h9DPIWoTB96aTTh9czKDliarJboMgnY8TirmYbwwX3xGa9IE9nILK1mnpLXCYvbElbff+K8ZqtQ
 aVRxiWTdQN85lvaeAc/MiNh+s/u3U1UiiVaTOZNVX9EuY55pFHJsflksaBXv7uuzTJdBr15U/GL
 1+khx9q8KY0fgKfSqhFNzh6TsLJIYmlUVjxJbFjB1IkD7AyGpyuCavXo2mEr0iL21WP1yZAjcxl
 RUPGCDOfIbJRxser+lrPGo+nT4M0z276T99UbTQQoEwqlF6SgqfMDcVMSB2LChqHqX70enDQVJL
 Oy+0bSlUTM478wbjZsw==
X-Proofpoint-GUID: WvYlzB8fs1_NEa0nvNZwvLmtU-DhnT3s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230205
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 973D017F902
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 09:35:27AM +0100, Thomas Fourier wrote:
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
>  drivers/gpu/drm/msm/adreno/a2xx_gpummu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Note, your subject is preffix is wrong. Could you please correct it?

> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
> index 0407c9bc8c1b..4467b04527cd 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
> @@ -78,7 +78,7 @@ static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
>  {
>  	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
>  
> -	dma_free_attrs(mmu->dev, TABLE_SIZE, gpummu->table, gpummu->pt_base,
> +	dma_free_attrs(mmu->dev, TABLE_SIZE + 32, gpummu->table, gpummu->pt_base,
>  		DMA_ATTR_FORCE_CONTIGUOUS);
>  
>  	kfree(gpummu);
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
