Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD2GMMhUj2lqQQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 13 Feb 2026 17:43:52 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2234713853B
	for <lists+freedreno@lfdr.de>; Fri, 13 Feb 2026 17:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871D810E837;
	Fri, 13 Feb 2026 16:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvfm7hlJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfW86WuB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A213C10E837
 for <freedreno@lists.freedesktop.org>; Fri, 13 Feb 2026 16:43:49 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61DF6JJP2627978
 for <freedreno@lists.freedesktop.org>; Fri, 13 Feb 2026 16:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=21pPGFIL/zCrhSvYIYVV0SyF
 kdzI1vjuhcaXVxySdG0=; b=kvfm7hlJLc3wLBNsbbesNIzs3hQZgCZWipk7fD3z
 uRk4coh/UiQF6uAiwpD2bK7+6ph07QbnRnxGr8aJO8Qh2TUJw4OEqYY8H+pZ5g+y
 IHwroE234Iw8XooYJHKBEdyFVX+lgGx9FGF4fr3NDeBHofKZmcmgbsRBZTfApJAx
 6MY5axkXXMB7irXO3FKnL+uqGlrIVJ0PkvYe4SIvgXBuWfUYB+Zti//ML7Jlwv90
 8iAtiZ714vGRgSfQzvxt8jfDsuKbZ5prDCMyu962PkpZOX++UQc21CjBdPlroVOW
 GfVo39Rrxxr8kDPVUZOtPj+SCSe9l/I9KeqP/dVrFAesMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ygut1ek-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Feb 2026 16:43:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-506a1ce5d31so17892551cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 13 Feb 2026 08:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771001028; x=1771605828;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=21pPGFIL/zCrhSvYIYVV0SyFkdzI1vjuhcaXVxySdG0=;
 b=XfW86WuBP+J7KeA/gt7hRQUFBv9EheZlg3tswHk33PylHbBpCChoN1ipexlUDxMkW3
 SfdD1ZrHS0J8ZqLMOZUNm86B2MBqIiO17DHBZd8D1UIQri9s+EnJCUg9w/j+uplRB12T
 7fc79iHYwok7WrLYBfZOjJi8JGw1QmtjebCnZnjDcO549tKyyL9Kvm1VjkXA61oKu54A
 Mnsa335VXV6DLCcjoQo6ETTfkaQQy3yFD/FPtsSM3WTUsJR4YrNCkBaFitWz+XpD6pbZ
 844Eq7rNT3QAmfWd5hJB3ubcEApOHIgCYP6bR5lkvVDY7AYNXj24nHZfGu96zwaWtgsu
 dnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771001028; x=1771605828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21pPGFIL/zCrhSvYIYVV0SyFkdzI1vjuhcaXVxySdG0=;
 b=EA6Akm+AWBfCrLaRRGmaZWmJDv4dQqnI4tu861fFCGJhj3Fz+iIqIsHAuYXNCTm97l
 p+acsiPqEQbJUHrBfgyg0Um/JZGevXlnbQv9asLVB/raQn/W2qrXccnh/QVQJvOthaB7
 MuggsU8abCMv3dRUmOtILod9iIvvF77iGrL7r9kGDCKzKivMtmcjBcAqvy5vMD3n6mfr
 3OzHLcCjTvFvnd0hktFLorPbZ/1P3D3obJb33SgX9kTtDLLeUdOlEjLlQM/f8AB8EPb8
 my3l6SZo5PXU1cpESuGl7drZoEsjN+4quTmW9tDj6b9iQbwWzXdbLlN7XGz3311gQCPq
 2gOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/3CZltwhdyRGghqk/VEFv/jxXsZLHuZTwkQL2N2L/F4lhMuAgqkU2oE75srX4+lo1r/oUwhascDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQkMkFQUoAXwDg0AVwgoVYuIbO9iTneXXqxk+pRVCI4xGP/Ij6
 ZaleLmj2oy1vAOuGJ34Ok3Nt/ly5qu73f+WU7d7mSqiF28FGTzdPMfQjQfzpt3eIPGlOReCssn1
 WBeIXBzz6H9nhzxtb+0eNarwSS9oD3YQU89Ub/MXs1zz+96RobIBzvi20aZIXA8q0oBQQ2X0=
X-Gm-Gg: AZuq6aLCkuKIPU3k/322GkTskibCy8tyRcz3Gd1PL6KEntWl9KExTwMnmiSxXSSZ5N/
 FT6ZTtzh4fCFBmffk2ZpIO9a3CEdw1Y1PI/ynLIKEUpa11qB9cFmsvEGdU4CNVjwnZvYEshWie4
 tBzpzn94tYEf6cuxqhjmtLjctGNbZL49v7gA/shjVB5v3UpHlUjydaHKGCKlFbuhL7Y0J2Yf+hW
 HeDYD4vmYfYMC8mAQGetLeepG2bN4JiXf4t9xji+xdqploi+D56Faat8PqxyQ9A4Z/0zoLSwpY8
 d3YOL/o09oxcrwLmBFOJtMWVq3FzFMBqUbO3Y/Y2XQb12Pke0Rd92UAf0qDIl/OWldWDCEAid5e
 Ao3if12FIiyqk7d4ATLZyddJRRNUYSwHvVjTtLA5ocvzdgyYYNA04gjVpc7Tq/Oxkiz+4oTyZXD
 zz1rbDx/2O9BrRvTQPdLVtcBQ/7AFBImnhwvE=
X-Received: by 2002:a05:620a:691a:b0:8c6:ee09:5eae with SMTP id
 af79cd13be357-8cb421628bbmr291427185a.0.1771001026652; 
 Fri, 13 Feb 2026 08:43:46 -0800 (PST)
X-Received: by 2002:a05:620a:691a:b0:8c6:ee09:5eae with SMTP id
 af79cd13be357-8cb421628bbmr291423485a.0.1771001026154; 
 Fri, 13 Feb 2026 08:43:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-387068e5ddfsm13919101fa.23.2026.02.13.08.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:43:45 -0800 (PST)
Date: Fri, 13 Feb 2026 18:43:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
Message-ID: <674jl5pvmoq3vktnc7vpasn43ncx4jj4zhaiegbmek7kqtseod@e7tkjv3uzjq2>
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
X-Proofpoint-GUID: 1x6yMPcjxMMblbujHJb7KQmYB5hDad-r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEyOCBTYWx0ZWRfX53PTWu0mYspY
 /lJhjvjaiAEFo2UgsN6vLAoaxlEg3oMSBR0Uk7s+JD7KnFDlfD0iosaQbfkmH4p9jfUz2xtc6lf
 7rAsRHRrhwltpZOZfplLWK3xzDQdvEDnRm4uV60u2CHqw/3GMZxrzx+/MXyZUNYIpDanox6Fxyo
 foO+KBXH/0DEcq0ZIAMTszArJxWfTbF0Tfsqh8IH8Yrf0jutLxle1BFB4yLAGTPW3u0u2mNtANZ
 WDlKgPBBGYgvOj6Isz9FFr6cMoAmUiIK5iHLCEs0Bmm9eeyW2LrXfyXC1/0C50sa0Si79ChT9hh
 AjJa1eiXvsepUL3W+knAO4creuTXIcV0JcHptYn0I22zIn2Na3/CzmGsHMtVsEF6XJHiHAjA+Tb
 4AT945Ap+3u2f8OLqDlnr1kbWso2HyNQi/tGePqzKgdYWFxX9VAMZc25roxvPiuElWFTY5u6HQU
 qemKW9INfjCF6LAKfGw==
X-Authority-Analysis: v=2.4 cv=If+KmGqa c=1 sm=1 tr=0 ts=698f54c4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=6cJ-CjKpxfkWJcI31lMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1x6yMPcjxMMblbujHJb7KQmYB5hDad-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130128
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
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:jun.nie@linaro.org,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 2234713853B
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:54:25PM +0800, Jun Nie wrote:
> dpu_plane_atomic_check_nosspp() currently handles both plane
> validation and plane splitting. For better simplicity and to
> facilitate future refactoring, move the splitting logic into
> its own dedicated function.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 51 ++++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
