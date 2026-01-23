Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OIQFOa2c2ncyAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 23 Jan 2026 18:59:02 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0077979468
	for <lists+freedreno@lfdr.de>; Fri, 23 Jan 2026 18:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39DE10EB89;
	Fri, 23 Jan 2026 17:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHjwkHJi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8HL1lgQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4A210EB8C
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 17:58:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60NDB4ae1325104
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 17:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ckrbQ0Dcn2KkakWCOeOQyrNO
 RUKM1Yp3djJ4f4UP3gQ=; b=AHjwkHJi0HJBT7HX77vgRFEcbp4HwcTzuDWwQrZ6
 jPFd9HgkEBq4giVK2odCov10T4lU4XXMLxfPH2+gNrdEBuoaV32nw7v7brzq0+We
 s6J2edGaHLdgPsRBwESVyH/y/ANfsmod+Ke6XQCg3NCWqwv0HgDMs7DovOXLNjvZ
 CYmB/irRKFCIUKJyuB7+NaSNEyquYhjYyuRj0SGvJ3YImBCY7G8r4+wcD8+RlLmn
 6ldGuQOisRJK/FebbZHXuS6NaMNUJAOCBBJamrAox5no4A+re7COv2s4JWxnWwEI
 fvDFTfSvmAN6YURDayqEh3sqFxIs7WR7pIHoUxF9RZabDA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv44ca9q5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 17:58:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-948351d18c3so786455241.3
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 09:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769191137; x=1769795937;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ckrbQ0Dcn2KkakWCOeOQyrNORUKM1Yp3djJ4f4UP3gQ=;
 b=N8HL1lgQxRH4sr2+lTtKwa7F2JUwBG/odq5SQtDY8EAYH9rux/XhUVSZT0LSOsIXNR
 tqiEDyyNMsNm61v1+xBCBlzdNs+eEmNm1ytm2/mM4rdkVlgjYHzCtJakyv83elzR+Ai1
 hKLPzjJJzBOEB9oSlaR0oPRyX1EE4iJlQzzxHUt0sA6SFp4OhwEpAlKHizZKshvRrROc
 Szf1N1iHz0B9q8wzu0XgQOii56ueI2EX3RiuqdE5RqrHlUzsvHTLSYkxv17/mO3WwpIv
 znzqr4g3tctT3DZ78GKOiqCm9sGOoKo8X2BZ8RPvwocxWUhU4JNTJ+7AGN/iRqcCVnYG
 zx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769191137; x=1769795937;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ckrbQ0Dcn2KkakWCOeOQyrNORUKM1Yp3djJ4f4UP3gQ=;
 b=uvazhZO6ZRqWRk2tjj+VlTZEuxiFvniVL4o9ow9p/tsF9GsgcDBHsCBrtTw+D3MYLk
 h464FfWOF4J8dXkBvFWz5pwGYdNuX2UDH0+hAuSClgDpSdRTpnK+1HAX3tBHCF819k4+
 4UK5sRDk81HNlk38LIR6wBuCOtHfrISxgeq845f4QBlOx5vP1QMaS7glLZ4uL+fv6kPd
 qR0W7HeuHBAik3+gWXWGCQzKn+cHU7qH3ENdrGjvP7VJPcJGwg6iTu/iVzsXWkEUmajq
 WtYYxMpLjQfUfL+vOaxjGgKaG4ZLX0LNlskTlzdi0Pedvn6TVdjzRbH45p+iCS2eDdXJ
 fd+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwRJUT+VtiO7pXXARvcRTkSmX3R6nynth0/5/HAbYMYa3rr3M/X8FFr70tCdmgAoxRfSFWVRaWPpk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvTGYsevvi1lrQKi28LmN+gS0xkpYbCZMdCyKeAdv1I87sbhAp
 OEFJ8hiVsgx8W6q+yxroIjP9hWAbE78vWlyOEaTNwRPYF0z55vPHnU+DSPMxh+dEeFTKu0TZ2XX
 vYaRw3mUBZ54Q9yHB2S8Yi/jG+/sZA9IeEYay0sihVvMWWtS8AdV3zKSxNcspzFOhDruDhcE=
X-Gm-Gg: AZuq6aK4OZBCuH0B+MXPWVBZLyN+j/m1oRxC9xrrglzPP3S12LCdCphyuK6rM+QMXrj
 HsEeKZqZv/UxVT/b30eeMDc6PSCvcGJLU+GCeg+TfSAADZBlQ5WlJcfw6JBfpsizzSzhL+RapYc
 WMBsWyTHMknjjtN53icab8LD1+TVhjNfINMyn1g3b3LXgzCFCoWCRCZN93GJPl+HGPK4ZWAal3q
 UCEaRX+4gQIzdYLTjTgCiaUtBeKO/3YfqIPUxSz369MeV8uLHTpQj+/PgIphDQazEVaxlZRe6q3
 zrRUTQF27NpgvMWjvYY2dArfgk1Uy8Ni1rSxeBaAZxHIW3Qvz5IlyXpceqvRjVx8svhQwKnLRls
 cbXwEGJTwsnZw0b1ub2svs/71c4CN/4E9bbmDsv2jKZNt5NzWHLUY7VvJ1tJdmTqpB7qsBFF9JK
 Wut8Aofni5BivZadgQWIrS1xE=
X-Received: by 2002:a05:6102:3a06:b0:5db:20ea:2329 with SMTP id
 ada2fe7eead31-5f54bcc0411mr1142232137.35.1769191136981; 
 Fri, 23 Jan 2026 09:58:56 -0800 (PST)
X-Received: by 2002:a05:6102:3a06:b0:5db:20ea:2329 with SMTP id
 ada2fe7eead31-5f54bcc0411mr1142206137.35.1769191135070; 
 Fri, 23 Jan 2026 09:58:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de48f0259sm801012e87.45.2026.01.23.09.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 09:58:54 -0800 (PST)
Date: Fri, 23 Jan 2026 19:58:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
Message-ID: <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
References: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
X-Authority-Analysis: v=2.4 cv=TLdIilla c=1 sm=1 tr=0 ts=6973b6e2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=mHnloJP8uCFruMiY-FkA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: F57rwYXPjZo40BOVCPqcrbAcsjcQqhES
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzNiBTYWx0ZWRfX/fLXSwfoIZ6v
 ytLNuhMW1seVjL3+sF14+2e8lC9xMZXF3llMExpu7fJS5RuxGznSFTuxxjivjyog0ivuPOqbl3h
 tK5DI1+d4GGTL2Nbu4AT9jS3jmMkQ7Fn8Dw8Rm1qKsI18/Zcf81VqBkQOVo+ZO0wwmguTDbah3x
 UcwBaArcgz5B8nhySGW3lbpOitkhp8E3G0BbCSgRVhvBzGaEI8H1Ask2S5JgTHjtl+0qQ2MZM7P
 x77E8s/xFQNYGW/9UklmSLL7zIFUF0/lzv/2/rXjGhoRsgqeDeo5hhXiLjD+JHU0KJSj5OqUsEY
 YjVHC/nvGZNBC5zAwnhO1hdIZ1n+K8nC/+2OSvZGWaAAISRLuqH6RWM0J7lhbgWepoON9zpwiJO
 Rlon/COwK8r0j/Febf3aSGXAqAzrHGxUpk1tItqw/M2Z+epFR6AMhh55hLmDp7DxRqcVObsLqK6
 eO4aFbdAnqOatpZo/WQ==
X-Proofpoint-ORIG-GUID: F57rwYXPjZo40BOVCPqcrbAcsjcQqhES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230136
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
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.156];
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 0077979468
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 12:37:38AM +0800, Felix Gu wrote:
> In a6xx_gpu_init(), node is obtained via of_parse_phandle().
> While there was a manual of_node_put() at the end of the
> common path, several early error returns would bypass this call,
> resulting in a reference leak.
> Fix this by using the __free(device_node) cleanup handler to
> release the reference when the variable goes out of scope.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2129d230a92b..0bc518d9fd65 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
>  	struct adreno_platform_config *config = pdev->dev.platform_data;
> -	struct device_node *node;
>  	struct a6xx_gpu *a6xx_gpu;
>  	struct adreno_gpu *adreno_gpu;
>  	struct msm_gpu *gpu;
> @@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	adreno_gpu->registers = NULL;
>  
>  	/* Check if there is a GMU phandle and set it up */
> -	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> +	struct device_node *node __free(device_node) =
> +		of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);

Missing include for cleanup.h.

>  	/* FIXME: How do we gracefully handle this? */
>  	BUG_ON(!node);
>  
> @@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
>  	else
>  		ret = a6xx_gmu_init(a6xx_gpu, node);
> -	of_node_put(node);
>  	if (ret) {
>  		a6xx_destroy(&(a6xx_gpu->base.base));
>  		return ERR_PTR(ret);
> 
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> change-id: 20260123-a6xx_gpu-cbc095dbe423
> 
> Best regards,
> -- 
> Felix Gu <ustc.gu@gmail.com>
> 

-- 
With best wishes
Dmitry
