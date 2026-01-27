Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM0cOcKUeGncrAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 11:34:42 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4D892DE2
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 11:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FC610E50D;
	Tue, 27 Jan 2026 10:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDiQp0N5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RS1TJY9+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374C010E51E
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 10:34:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60RAVK6D3714704
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 10:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pSe6m9bpQlKGAyhQeVQfwUOr
 nWUJ9Hu2tKR1AdBPD6I=; b=KDiQp0N5T5oo4vxAdnjXwTA9yxewWrg/BwPHIizi
 WtoZRo4fhTiF6BrPcuoImB3rE7bXgwSrMLBirk8662FK86+UlkMAMU9CZGLSHGBS
 iPiviSG7ijibW3Uj8VbxLEoOVKK7bxGZbuOM24SdeOtQVERgvoAVtU7v9KLCjHMF
 wIy4k2l7+rvXQryz0XYpC20DMcAnhCSUEqrKzHRJeYpfeaKwntxonGQkB+7xGaeR
 P8pcKSL/G6geZCAITJ//T+/aR+wyZa/i3fQdEYKMOOTRufDbLrZB/22S6F2d6IBY
 RnuVABbDh569TfLh5S3Iw3qMTLawRuJXqY43N5gM3Ma5rQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0an69-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 10:34:38 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5f535184cc5so5114863137.1
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 02:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769510077; x=1770114877;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pSe6m9bpQlKGAyhQeVQfwUOrnWUJ9Hu2tKR1AdBPD6I=;
 b=RS1TJY9+AqwIphipR80390zbfTiJKPnyqbsFCFf+hZqgNvYLd1MKydnq51Cv2g8WSC
 ufBPxLAYQc7X7T0XPENoLZz1X/4TwYpLFWXZxOOdvuSQgIE8tV+ygfbjtnsEylCJrthz
 Eaxwps3hPBsAzexa50OXlvSQW09AM5WXAsD1sbSZRr/KfYx+xOpDqVgNANSFbZe/2zKO
 o6LDqBqS0eOUJH8xVmKRZUu7/n1LQ+Ke+2neE33lt2eGLSMzKfqJ7cI/Zu1GJVOlCosW
 +ev654zaMWPj7oaWcIQbcGjDkCwOane6yXEDUKcNY8X9wwCApb0aFmQ6GFIBd66CZlHN
 TCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769510077; x=1770114877;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pSe6m9bpQlKGAyhQeVQfwUOrnWUJ9Hu2tKR1AdBPD6I=;
 b=w7AoyW+xSOthgMbaH5pwQOHp2vV40y3aAYMvdKvzYIB6+2OLpv/rZy36jvks9+LK1t
 hVebqSVRODyAn5BvpMvWnjauRkO+E49xjbKfBQG8yrOqIAmFuUW89ljysx0lSNocULrh
 4paVRgVI2ZryUehW+TQpJoH8qLrhnIDoCqOz24BHc75ZwBA/26lMoaYW07iYxpAngFkv
 Z+UFG+BubXq9KMcU0+hN5uQdlmLW4KGnrUL0x8/I9ojJ/MaZ+QnNK14Bp6/ZvGMJsy8S
 gRWZZCUderjQ3JRTiBPCDp16vgBaPVJkQIrO+bWua8noLjM/ffrsIkqfGtgDGvfbw9hN
 ORHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzjt2GtfZYsvK9c/f5rQY1E2nZVG/Ocf7/1Ul/6jHnlXm6Gut0nZGjVZOk7yya6RnYtocDElgcvgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNF/62XsGQTgMqdqHEymZTLxCCXx24h8vVz3aZHb93wtiwwVqP
 p1r2B2bbABPOXjXvh0cvyaGPhD4siAHe5vZ5eAAeKrsz3rcu6aVKnq7H+gBf6VFNpZVO2BfgRFP
 NpYwrKrF32Vr27LVlh4oHWDmaRUziPLjAeJ1kxaFuKrv97PmXyIlGwdSnT5iEBbk9dQYQ0O4=
X-Gm-Gg: AZuq6aJfwsOIxUUjrRqVPaaPiBpcvNHNuoGEL2ZctVn1SdFuFoxVeCK9aThZ6SBli9A
 foN/wAfSIC/7TAJr53xByMmZVl7bNabQ0OndMJGS0EtZWOJwgbyj7bWMq6CwVPhZTJsn4TU2XWb
 xSRunjIxLlrYliI0VvGklPHyYYLGRT4LtJy2i3z4bb7YQm2x9rUzz6czCDDVT73Ilf99SwFfunN
 ATh/Wg6RO3FQr9ySvjNESNVIR3otvDfJQ/Nv5Io2nSB29GvIp3P96UX+m48RXerKbbdOOvT0H54
 oamiRGE2Fafrl0W8Txq6ShNbmkTxy4KnUdKceJuIkcAwJphJhM3tUS0/DwWSNki2lpsR7MCOiyq
 OBdjt0DW9I0Tm6qeLpUYBTHWl7rybHlT+swr2r4jv2/Sle+PmxRrwHdu+pHHxt/p4vBsN754I7W
 K2k7i8YaDGtYWk9MGb+TMWKVc=
X-Received: by 2002:a05:6102:3052:b0:5db:3111:9330 with SMTP id
 ada2fe7eead31-5f72379c46dmr540403137.27.1769510077589; 
 Tue, 27 Jan 2026 02:34:37 -0800 (PST)
X-Received: by 2002:a05:6102:3052:b0:5db:3111:9330 with SMTP id
 ada2fe7eead31-5f72379c46dmr540394137.27.1769510077057; 
 Tue, 27 Jan 2026 02:34:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de48df625sm3295728e87.4.2026.01.27.02.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 02:34:36 -0800 (PST)
Date: Tue, 27 Jan 2026 12:34:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
Message-ID: <whko2yur7tgutr4qhlbqfrvpcdg7hkyw66koicqvpvfhk55c7z@saj2uxrduv4z>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
 <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
X-Proofpoint-GUID: MHXynelKdTeVeLtxVHROW40Y2i7-vFSd
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=697894be cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KlTdY6ZzAAAA:8 a=EUspDBNiAAAA:8 a=Vj5JY3D4L5YBHjkz5HIA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=7M2I9cFuLl8dRdVq5wb9:22
X-Proofpoint-ORIG-GUID: MHXynelKdTeVeLtxVHROW40Y2i7-vFSd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NiBTYWx0ZWRfXxt/5XXwhq0wL
 1lBKTAUmD5sgKpHKSJrHnxQRmC4Ue+AJobjRZqdEaVf41YR0bsoTXIzp8ethpPVLT1VGnrduPFA
 F77/T/YZen/PAIQDl+UOsL8AlytiVWTJnjlAVY64yGnHnCJWRRKhkGtwQk/gOvA7njowEnpbEYt
 CdTSmDvFXPytxffsTrZeyjKOVkiZ4Yfkdc1NrPcrTOJUmz+X5CUzamia71Q9B4NwcsDdoeAGZep
 9vwJXHAfiizQzi3XpKpFyxbFbhda9qQ/dvAVt3bRRmCoUUEtsvTGSxYN1tMAGHYIxw3ZOMtSkr2
 NDd6hVWpF19glgfbpB2zyCbTAk6ZTdpD+bTYZBOU1YQQIIw3wvAkn+BzHzErMP92bn0KokSKzSj
 H4yxCeD2CBSD4o6sZDY8KphS3OXK91k5XOWP9fR9HK08B/xu1wmpzJTXG22ckevcpe23nhsOCPN
 RuQ5MEysZJJEfs5vyjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270086
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:robin.clark@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 1F4D892DE2
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 06:43:32AM -0300, Val Packett wrote:
> Hi,
> 
> On 1/15/26 5:05 PM, Dmitry Baryshkov wrote:
> > On most of the platforms only some mixers have connected DSPP blocks.
> > If DSPP is not required for the CRTC, try looking for the LM with no
> > DSSP block, leaving DSPP-enabled LMs to CRTCs which actually require
> > those.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 52 +++++++++++++++++++++++++---------
> >   1 file changed, 38 insertions(+), 14 deletions(-)
> 
> 
> this has massively broken things on my x1e device (latitude-7455):
> 
> - upon booting into gdm, the internal display is all dark blue
> - suspend-resume makes gdm appear fine, then logging in results in another
> blue screen, again bypassed by suspend-resume (vt switching back to gdm
> makes it appear fine but switching back to the session, it's still blue)
> - OR blindly logging in on the blue gdm makes the session appear
> - plugging in an external display makes the blue screen flash constantly
> over the contents, there is also a flashing vertical gap between 2 halves of
> the internal screen (amazing effect) and the external display doesn't
> actually refresh the contents under the blue
> (https://owo.packett.cool/dbg/dspp-lm-boom.webm)
> 
> Consistently across 3 reboots.
> 
> Reverted only this commit and it's back to normal, so I'm pretty sure it's
> this.

Interesting. Could you please capture the dri-state (only the last part,
resource mapping) with the external monitor attached and with this
commit reverted?

Also, could you please run another check:
 - revert this commit
 - comment out LM_2, LM_3 in the catalog
 - try the resulting kernel with the external monitor

> 
> /sys/kernel/debug/dri..: https://owo.packett.cool/dbg/bluewtf.dri
> 
> 
> ~val
> 

-- 
With best wishes
Dmitry
