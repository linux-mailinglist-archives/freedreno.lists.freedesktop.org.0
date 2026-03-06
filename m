Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBVAIUMhq2mPaAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 19:47:31 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E343A226D60
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 19:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7657010EDDB;
	Fri,  6 Mar 2026 18:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVAjrCY5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9t4bouj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3543D10EDFB
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 18:47:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626H217D668129
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 18:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xUscRt9PkJfXclN0l0QtK+rE
 L2+xLTOFDpKgHRcpxBA=; b=RVAjrCY5rpNslW9GVgCRo31k0oo0n3frulR0LfeO
 6HtgKl3pBCq0JNF9c0YeQeR1StLG/7/nZi1jp3FOx/SQuhj6CIYIWfK/LHeONkof
 JSk3XX1bI5EWcHNbIiqE7Ux8sI6hxW7i045Hc/3oD0TwWsiKOGYO8e+qUnQQ0SIX
 qx6x/0oDpGZzTglb+eGWr/E7x3RNps01g/fQbVqDs5pG4w9MbR8HNHAbsyAiY7wK
 /DHOalIkXoGFohizLcu4qpeBTN4pepA7Ai70IWWPQBZA0AXi6AorjlRVu6Zs/J3c
 OiZbvv/ucEimaeG44Zt7i4Y8f48yShJSYcXnDFdaX1Zztg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2ye0csd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 18:47:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb706313beso1257348785a.3
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 10:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772822847; x=1773427647;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xUscRt9PkJfXclN0l0QtK+rEL2+xLTOFDpKgHRcpxBA=;
 b=W9t4bouj8VmZbIPm2AHcYar43huuOKvB2A8nbf7ZP+v6DIfGxlAho+E8/0Yn1+P0vr
 37NCvaGr0FuUZ4R9tg5QB/Q7KflauTicg40Keih1hoLCrgWpq8ay7xIdS2SOk5NmWCJl
 +TYJmjcGn78COJQ58cGYZbHnIJABqTykgUazs+o48GpBz9bOjPR1DLCC0MG9gPaYVVjF
 oWFe2S1lU3IUM4C197c4leU1IYhULP7ZW7eiY6jim4afKTisYY0LuurHSGqktPhDRbxV
 09X4FYLohWJjCh2rOqr53/Q6MtjBTsUTWZ10AzXWX387wIS/OBoOuLbXhIiqr7z2EiFK
 Xing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772822847; x=1773427647;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xUscRt9PkJfXclN0l0QtK+rEL2+xLTOFDpKgHRcpxBA=;
 b=gOMJ+6n684sVNWXe1GNoMbREJQdbPXRjW9cOBRRaqka3wu1FbbXxPTgIogBKEPjpAx
 HxRdwzJ3UbuaxLNIL0w1EqiC+rtcXm1PnaZ0YVSQ0a5iozn/aObjweVA8bPbMguiAb/X
 0Mqetp/vmp3YMn7KuZitt7vXBW2lfVwkqiivywYnG8ig2M5TbNA3tVY3KRbpwHCmqI+O
 XMUYfnXMghuBW8gU81fHvU84DLUtmi4UKXqb2xJLILiPGfnZpaK7ZsiMOX4teLYeICBx
 LKCe/bby6kgtN/huC5PkrPeAez48Nd12REymp962srErzfp0TuziyzEKJjJndwTqZqsH
 hovg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXq0G1zRrDrpqB6BeflYzVXxjwsk54YuqInZEkZlB+8qheX9SjJm0T1tYya/0CcB3AKD1okUQDBTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUPmquuql5C1W6xc8cTQm8kDjYarr8yenrk0C7s2WX84/8r14u
 pFgzHKYcJjxSePrad3wGgw5feYDsLmTBO31KhroT0ZYQ4Ewp3GHY1EkVnhaw9vTMDoVCUuf+RLD
 ffX0Nt5TIpPYWrw5Rx0rcmlOTXBEk0HzS0m7nHH6XMS8kIgcth0iIjMrG+Y6Q6YJvuZQz8CA=
X-Gm-Gg: ATEYQzwMeRJ7oLVu2dHvvT9InklUE/rLhmmpKePOLf619qDM0qo+54eMFZcc2tbDXfw
 ljBIHN8jV5mKWv/j569HIaXQ9Q4NQwZqPXc1EvSWKCsjfAtqhlWfI6t4RVQ0tydb5SjfUURAH1q
 +8XLfv8VtN077V/kBBVYm9J4uRFmV+1jGgUJsxUKaHYAyvYf+Ew7LGQxNAUa+wfy4R12M2hs+b5
 zEhEfzETABen1/8qDRu6dwTlk4zLD8k5q2jxG20vtbGtTM6NwEj6j0rxKw6UQ0PXiwI2clCN7ya
 ekyqIBn4AW4fnKFxu31Reo16eOoCsY2E4bMQbJ0nhLK8vWCKZhQp6mmd3SPokgWObVx4ZKXx/Z4
 ImPSxwHA1KFIAaFGNE0QEKxSqSYABgHnP1xuPvxtPQISW/oUvFb9y0/w3GKOf5UhHA3wJxCety7
 41gESc9Nhobk8bwygNvK15B6bTdWg2QZVHl0M=
X-Received: by 2002:a05:620a:1726:b0:8cb:4fa5:d47a with SMTP id
 af79cd13be357-8cd6d494e49mr390658585a.77.1772822846526; 
 Fri, 06 Mar 2026 10:47:26 -0800 (PST)
X-Received: by 2002:a05:620a:1726:b0:8cb:4fa5:d47a with SMTP id
 af79cd13be357-8cd6d494e49mr390654585a.77.1772822845978; 
 Fri, 06 Mar 2026 10:47:25 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38a41fa7bd5sm3212991fa.15.2026.03.06.10.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 10:47:24 -0800 (PST)
Date: Fri, 6 Mar 2026 20:47:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>, Eugene Lepshy <fekz115@gmail.com>,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Eugene Lepshy <fekz115@gmail.com>,
 Danila Tikhonov <danila@jiaxyga.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
Message-ID: <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
References: <20260306092518.37849-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306092518.37849-1-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3NyBTYWx0ZWRfX5SgNE5K7Jshg
 liuRl40+EVd9Ww0nJPSrs7mCZWtEdADbDJLT5J6HXF51d+5+3YvqULBagWoWKqKNaB/vA0lKAmF
 PhtproaoQNmjCo8chNe7sM4niSjdCZcRF1lher1ArcehswFgqMj6CoQjSfUSInXBWGnXG9huyID
 vgW8AdSgFkhFhK5Ub8k4hNBwqkTwKwLBIGJUkDg//vvf+fRQzwcQrQxyVq/nxv+S+i09anQHveQ
 Ms90eDSSBxsu4rnscMGLeuqIpUaWz6tC6qo10j7ZtrvIkS7K1c9EnYrrjAv4WmYhg8seA5GfCYH
 lQRCmFZ8k2kgdpQ0xtaWFFq6p6CPjsYYjDs76XZplwJUg9R8PRKjvT+wIxGqoY2P593fdtrFV9i
 dJ87C5lb0eQv+UcJow+qt+sjkLJrA++VD4XHQ05APP95zUdicQiLWBktgyO6uMcEzu1NXMDBB7d
 qmRRc/d7MbAYt/PNZaQ==
X-Authority-Analysis: v=2.4 cv=Bt+QAIX5 c=1 sm=1 tr=0 ts=69ab213f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=pi0S-Vlqv1HzeT5xHfUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: VE9ruBT0iKXQI-ZjTW0RzAX7DvVy3jrb
X-Proofpoint-ORIG-GUID: VE9ruBT0iKXQI-ZjTW0RzAX7DvVy3jrb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060177
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
X-Rspamd-Queue-Id: E343A226D60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:fekz115@gmail.com,m:danila@jiaxyga.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,jiaxyga.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,jiaxyga.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:
> In upstream the msm, for bpc greater than 8 are not supported yet,
> although the hardware block supports this. Remove them until we
> support them.
> 
> Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits per component")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

I hope Marijn, Danila or Eugeny can comment. The patch series with this
patchset added 10 bpc panel and used it for one of the phones.

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e8e83ee61e..b60b26ddb0 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>  
>  	switch (dsc->bits_per_component) {
>  	case 8:
> -	case 10:
> -	case 12:
>  		/*
> -		 * Only 8, 10, and 12 bpc are supported for DSC 1.1 block.
> -		 * If additional bpc values need to be supported, update
> -		 * this quard with the appropriate DSC version verification.
> +		 * In the upstream msm, only 8 bpc is supported for DSC 1.1/1.2
> +		 * block.
>  		 */
>  		break;
>  	default:
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
