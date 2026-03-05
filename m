Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI7SDhPZqWl5GAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 20:27:15 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975F621784A
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 20:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C3710EC6A;
	Thu,  5 Mar 2026 19:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5oAXuPg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOOb8KdV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B1C10E128
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 19:27:11 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625JQYZA1164268
 for <freedreno@lists.freedesktop.org>; Thu, 5 Mar 2026 19:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7GcmI8XP+y5dIBbSvMUZVV20
 6VKQWxQYIDZ2fcds9Jk=; b=G5oAXuPgtZtoZWGleGOCvOF7vbp0JsFrJf15qRjX
 s3lookP3BglqXSbrN3zMgVD5DcrnH9QkROI6b4Tsm1TY2B+0qtIX8Ow14rTj62Ca
 qoXaGeep1myugXJuHVy6fztHQ6ryrge9XqylGPddkiH6l2XTwj1ZjdxoMumlAAh5
 PIGGN42tLkCPeZbcKS0T4q0Ce4v9s2OpjC0tSNmFWYgGMptMgmQRfz1NuP4zRwhE
 sI7zOxmCMm3CY1pRXK5leWRzEHnKhzcBgqduCL7+3iyg9C42EMClU5j4TEBCty3B
 rVYsjp9WGzpaYhQ4AywVun/IvvRaL19dv+cFyq1HJoB1lQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09r02a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 19:27:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb37db8b79so6071460285a.3
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 11:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772738830; x=1773343630;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7GcmI8XP+y5dIBbSvMUZVV206VKQWxQYIDZ2fcds9Jk=;
 b=HOOb8KdVoxqaapV06BAVTjwajo8SjFWmXg10SHUOhuIJYbt/2NmPVcLetrkQeeSKe4
 BdKxqTW5bvCmxPgBccjPRZpOZizNuqzapW3eeM+Y5KQL4CCjzprgreLk9sw0x/0WHIZb
 Gir1VxR3/KXNPitQeF3sfDG6YLd5zD6I9iewt7aJmgZvqFZU2koUhptj9Sz2U+KMylZw
 hM1SS8Ke0LkQz7tJSZwmG4lEBYB/K9IaktHaNLmxv+GUv1YUmhfXaOYG8mSjOhL5QNLD
 itkNp/WEwpmjmes1lojTbTLVIscUML2Ii2M8FJ0+380m89N4GFV0/AY8c7gS+nddkGZB
 Ncng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772738830; x=1773343630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GcmI8XP+y5dIBbSvMUZVV206VKQWxQYIDZ2fcds9Jk=;
 b=U7lzCTQ+KL3XzZkP0pNjfGnmNkn/KkvCK0B2sNZtbC+90deBu8fpRghGpEV4vlUK/H
 gicWPsGOm9AUPVK5YpD/qataxbjK6FpTWLwk0r8eq+HORel7CEB4iXNxizoZsxOrZAcz
 hexc525wrj38OKjxPrznB/P7pmyeactcOorpohwcUdUP3dcWdVM2VJGrxWpFTcZi3P06
 jf+zWuvQvUB1MSfVqJiyLdAYBPEZ6RMS6fWY01lco7tAD5WzLMO2TCHyJCmL5lL9k+7F
 ew1vmN5VS2dxE60BzJlCrR1Sob/IcN6JbuD/vM9nGd6UGZX1mVyFzePuX/qLmHom+v68
 YZig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1ua/gWAabAox7enP8RVYd4B9gDDyIOqs0U5PfLCDH6mVz99OwzJ1UeV6XA/IdNX8bctmHiLQcKFQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhdMde7e1b4qfnPkg2X0l2X6sz7/T5sL+2jhwd12XmszYyvaz/
 W8Zir3eq8Az56I42ju5Tx3qDBnyhhcFqbGlZcG5mw4gEpX7/Dpabs0R2Tq9uUZ1SsZWzT62W143
 kJiEZQKb9R59SZ6kzHscmX/oFzPY8gNVGKgaZg/fzNhFSBgtuGr9797USzcCgIApkjLNYTJs=
X-Gm-Gg: ATEYQzw/IkP5cyffsB4Skjp4T6418ivP/UL0UalRedv5SC3Ww3lXvuXp5HdLIQIH/il
 7Zgur+7gG2ykc1tNTaDx00AUJUXua6BPA1VFNuvYI/gnH8wbX69I0RINuflKLPzmEZCvLWnA3WE
 AP8WTVuys8e2f7AdsTVF6SQSupHJkRUABUI/gXLKdCcZEClsJ65rOt6f1kB7P69y9DwG0H9nbje
 BpLeiXAYzjTB87eHMXgKg5acRTJ4wWcIlu3STCKHYs91qwzKrl5xIY/Z3fnkeCIjLdYz85FeotS
 AEb6VuZqwvwxBgydWd3QcKTEV7O+VpEaR+BiBicnYUP8BobUW6hRxHncLZB534i7QS/T+BLMATA
 2FjX1THTJ+4I++oNOl9UyPwOh7F4TXbnrgIWm/G3sK4Wg3BvEDk0Q4ZKEEdwS5N8f06M3t4NzPi
 wUm46p5sDIH33yypSHJ7kmnsuoIE1Fwekl3Tg=
X-Received: by 2002:a05:620a:199c:b0:8c7:132f:ba95 with SMTP id
 af79cd13be357-8cd5afcce1bmr899951685a.81.1772738830077; 
 Thu, 05 Mar 2026 11:27:10 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8c7:132f:ba95 with SMTP id
 af79cd13be357-8cd5afcce1bmr899947085a.81.1772738829518; 
 Thu, 05 Mar 2026 11:27:09 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a123586c0fsm2162212e87.9.2026.03.05.11.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 11:27:08 -0800 (PST)
Date: Thu, 5 Mar 2026 21:27:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a8xx: Fix ubwc config related to swizzling
Message-ID: <5lh444wqr7uo4wdjg3ffon2jlupye3l7h32tdescicj5nnpi33@rh6colauigkt>
References: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ioLGjQXaYLGalmC1YsVzW08qz8K8y-YU
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69a9d90f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=sCGn9XAE_lF3poFM8OEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ioLGjQXaYLGalmC1YsVzW08qz8K8y-YU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2MiBTYWx0ZWRfX/IbSSb8rFihA
 HCD3mrFH1QwOUeB07Py1yn2+uyU2LrF3GOiImHeo63+J0wd85GPVzAanEQo8QaGG/L/NZprKkkz
 /1pxtcLBZBvrkKk4zYSoZWdFdKNNXwc6sOiRPbXcZXNgR0y4aPW0dRBjq/b9fsblarASA5Dvx8k
 F0kayd07Op+tr5COx7vlL/ehcVEMbPnOV8cgX6Lx/xphZ4H7p9sncr+Z68hUyEshP/7LnmnEk7V
 3kkavboHQkelVPmPac3XNBMsykAF0UMpy0gmabH+HTU3UKNNpZ1RM8SkVW81z/jKGlmabNogzjo
 5olzPP639JAfNjs2XZr5EoSOaf8O6F7URV6U2WtexeZQq2uWOEvwaBYdoE2P7gWZYsh34Kt4SMP
 Lxq7bAM5qVOS2Rg5cdesBjUwSq48MzeKGjxQkJYv8iEwyUxtCFnD2ZPZBYsqX63FSyVrf67SJJK
 ZktnBBX11RVveEeoV4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050162
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
X-Rspamd-Queue-Id: 975F621784A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 11:51:16PM +0530, Akhil P Oommen wrote:
> To disable l2/l3 swizzling in A8x, set the respective bits in both
> GRAS_NC_MODE_CNTL and RB_CCU_NC_MODE_CNTL registers. This is required
> for Glymur where it is recommended to keep l2/l3 swizzling disabled.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
