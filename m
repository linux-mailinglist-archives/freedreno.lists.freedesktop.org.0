Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC8B1D40B
	for <lists+freedreno@lfdr.de>; Thu,  7 Aug 2025 10:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9558D10E0FF;
	Thu,  7 Aug 2025 08:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKN/qU05";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415B810E0FF
 for <freedreno@lists.freedesktop.org>; Thu,  7 Aug 2025 08:09:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5775biPl032385
 for <freedreno@lists.freedesktop.org>; Thu, 7 Aug 2025 08:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8cnnTCr0BqMwDmRXCSiVDYTd
 XzHaxhvasLyMTbeTJIc=; b=CKN/qU05FMQA+gzujiFPkSAKQUw6MA7hFbZGfL3B
 hOfHfrjY3mla9zEmM0PjyM57K7HkoioE9acrkNfsUaBTtJge7/QBPTvcYOXIL8f1
 QVZvtg9CUrlX6CYJLTRuuvNW880rVGXreMyKdtc44/H7VyKif3trXulIayw6wIaO
 0nMYOcx9hlb6Ps2NAbkacfPZAnobsaw/eYlQqkHXGWxPpHghEg1+ch/rclvVyCT1
 E+Ol65SLHeArr0UkQD1v8tzbPVeFeLQseQYC07yB/xTsUyjSzGhtJEqt34ca+Vyd
 Kw5gm8TEYCxoYJvmdczmncr3aJQYCyhBBsS6U2ay/g+kMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2wmcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 07 Aug 2025 08:09:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4af22e50c00so18146071cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Aug 2025 01:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754554183; x=1755158983;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8cnnTCr0BqMwDmRXCSiVDYTdXzHaxhvasLyMTbeTJIc=;
 b=wSLTf8JZOpP1FnW7HEUDS7efM+JP9Z3BRpT9dTrwMgoNt1j1yGiHvxQXyCSRpKlTRf
 FZdsHkIPTGLwDF7mQxzcJlIA7cK0pJAUKTtXnT9Jcnohpo1DOY1Ve0YfahMyH3z1+6Qp
 Y643zISZA8adFuDUwnZxZGLlZWE2KrlOkWF1Ix10tSM71jdqqLJhGZJfvRcAhlR7pDra
 F2XlhZ88Tb3FBpjIB0OjA7uej+vKK3pFe3lzmUKQzLE0l+gdT9nNOSaO98/jI5C3qvH0
 kwAAV77O6URTpyX+Q2fjgVYcztZz2+7fuyaXotULR+H8RqAI/n8z1+Gxlu3hQhBJSYxe
 uQbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV48c2J+S6lhg/URgpJ4q0dpWZqq1armIcZgjGC5xi6RFcg234hvXUlCKBa4MNcZQwgYCpahrKdNgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwINu//8SeffgXJ2nXMcPYVUfiJkRneNoCtwqBJg8OQtFQOEMNQ
 u/HsoNEWl1oNOq6PS/Qe84DxikXCcO5e7xnzYGvPgKAUPIFqE5Z1aqcpdFgp9atK/YDX2bKmYco
 hp352oklqOiGYt+JCOzm7HT/YEiycenBjbWTKL/d4brY/CHYv9qkrxBiKxjBIFlzleGdCfEo=
X-Gm-Gg: ASbGncvyKD57okNXMYiX9qdUEjxJMglCRLRfGw8sStbYmHiXuW/o9o3pi3fuB676L5z
 X+hDkwucr/1XQZk96bj/nF59Pj6DlK40OOQVttncAQ2o7YZJ1ovUqUwJaWQEAZvNsTLcsPkBUfE
 BgZDCi2AKrndbSECInxFsyMuVRpFLC7GXFcP7PDzGYJefYyAvkSyYZGXm0gjZApyJ+QNpwVRV9U
 5plPLqKu6uDM+QPH+mlAcLi+STLKX7WJS1hPtmkI9Td91Vt9N7frTKhT8D52tnFTTDd0TBQ2tSw
 BkVu7IFRc2MdqiRC4peRouF5g99oEdsBay3NxNH9S67pl5iDwSRZtSZwAFSLnAyz7KvQSnE9zAu
 SfXvlx/kps4ZMUfGH1Ss10VAZZEMNpF3JRccOUFMamuQh+cUv0VEH
X-Received: by 2002:a05:622a:1a93:b0:4b0:77d7:c8b4 with SMTP id
 d75a77b69052e-4b0924fe2a8mr88796321cf.14.1754554182858; 
 Thu, 07 Aug 2025 01:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr6oBPT/KIywasjRNJMXRDMeHau1nVtpgPLjvj4ivB0nSsqqEOpEjGcFvOQTtB3vlNCloQQg==
X-Received: by 2002:a05:622a:1a93:b0:4b0:77d7:c8b4 with SMTP id
 d75a77b69052e-4b0924fe2a8mr88795771cf.14.1754554182037; 
 Thu, 07 Aug 2025 01:09:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388fce24sm27550341fa.66.2025.08.07.01.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 01:09:40 -0700 (PDT)
Date: Thu, 7 Aug 2025 11:09:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Message-ID: <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
References: <20250807072016.4109051-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807072016.4109051-1-arnd@kernel.org>
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=68945f48 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qCxGkQd1JP7TPUfVb20A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: QtTtCtB_PlbKvkhQ2Jo8UVrTYqSTIfjA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX0IhVIBaLVsUp
 HlOsDRkzQBYkazUizBjnwUq73nwDfMISe9EiX6VBYrSBxrJmAY94gEXctgRAuJQJUAFOXftZGtD
 L8pudr7r502itrkdFv6SYjdD0IPfMSXrnJC/TkGJyHP/CtjlSWKgb8z8Ztcu5rI0YoYW4d7nGP9
 R6SryGVgt9VyX0Ms419IQLOcmlPaXC1eI+oRhMUeWlMQjSQZYNIrJ8SulrWPmdgPtUR1rYmpKuS
 LMX8td4avqlsZ9NumFBlVWN0CQE2I0iRJXM11cqf3GIwPsdbY534NvwsKvFIChUyIO3o3tKgeXz
 iZQi7M23UQxs1ILc+OW1a2HYsj8i+tssGirLjc0KAuZPg7XSvA9OmmEPQ5rfn7aIlTHl+nZAZqf
 RQzl7wVf
X-Proofpoint-GUID: QtTtCtB_PlbKvkhQ2Jo8UVrTYqSTIfjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
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

On Thu, Aug 07, 2025 at 09:19:48AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-21 points out a variable that is conditionally initialized
> but then dereferenced:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1138:6: error: variable 'crtc_state' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>  1138 |         if (plane_state->crtc)
>       |             ^~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1142:58: note: uninitialized use occurs here
>  1142 |         ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
>       |                                                                 ^~~~~~~~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1138:2: note: remove the 'if' if its condition is always true
>  1138 |         if (plane_state->crtc)
>       |         ^~~~~~~~~~~~~~~~~~~~~~
>  1139 |                 crtc_state = drm_atomic_get_new_crtc_state(state,
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1132:35: note: initialize the variable 'crtc_state' to silence this warning
>  1132 |         struct drm_crtc_state *crtc_state;
>       |                                          ^
>       |                                           = NULL
> 
> The bug is real, but the suggestion from clang to set it to NULL is
> unfortunately just as harmful as dereferencing a NULL pointer is little
> better than uninitialized data.


Having no plane->crtc is a valid setting and it is handled inside
drm_atomic_helper_check_plane_state() by setting plane_state->visible =
false and returning early. Setting crtc_state to NULL is a correct fix.
Could you please send it?

> 
> Change the function to return an error in this case.
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
