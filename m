Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8802AD2628
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 20:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B135F10E422;
	Mon,  9 Jun 2025 18:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BeQjhE0b";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FFB10E430
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 18:54:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599RBZv006381
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 18:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0Q7j6JWLfPAIL0zTecYfobk0
 dPt4Avr6FVotIxI6daM=; b=BeQjhE0bIDAzAZ9450ceDp5t5AFtsbnnpPL7K7lD
 lY7CXnC9+u/2cJLe2hAP05S9UhNYODDnkThUmBkNaoIZ3sBlwRVQi38IRBp2NUkE
 O+7hmUk5zqhQKIse4m9cOW3SBO7NBC5UjKavLOVSPgWR7gAn+j5r8vPwPO++mE52
 qYCHiJhLo0XwKfxag3OJoBbvqSKDu+6VPk7fhpAAKZJPGlFcSMidTsCuVEl5m3J0
 0I5E413QGPINSfDzmJS2Ul2N6NKVimM+to4dwxiA9GxtZ4qhg1sidqquRit7eOW9
 94CIR7AyRK1ng/FgbdeaFZbI/d8GwueuUxKIMOYAALhr/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jesab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 18:54:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d0981315c8so472541985a.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 11:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749495282; x=1750100082;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Q7j6JWLfPAIL0zTecYfobk0dPt4Avr6FVotIxI6daM=;
 b=hGwwndhNnUS8V4VeyV4/H7AvRubwFvNeMjfUsRM5VrGHhs9SNuR8LYnJhrSgIZSSMu
 RJwMVtMzFLHCoiPtAqzh+JhkrcR9cUxee5y8sPPVkozqreThPCV2JkgRgHu4X+hn9XrW
 G/uNNy6FTuA/J0Qgr4SPCWVvphxPlWBsUnQRgaWPhlivqrZtaBD8A0Le/qSQWjh9sHR3
 QnOpc7P4lLqrh32bs/svvvOQhPM6qWMifT40jjsuOree1geYtthXtgaOZwzk3uoOl6PJ
 p2p8/FqF5V/Al7anSz+ut2B2EdOD6aEf7EVldGweSQHCqcxYkzJkQJkV8Kq+x3LucBpr
 kq6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHnR07430fxt/jBXe9/VYZ4aRLVJzKWCuC+v/1CmCyLKQSvmmb0ZZm7nDbKQTMAyz/fw/FfHfcC6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfHfH+1gEbQXrxqyS+EZJkI9yCtCQ3X+q2nHYVZsV8JWY2FPC0
 rxIZwEYQfrmCSyUgQZIoURUGFJWiimlBzKXO7VtxDNTeQKPg6iyNBYOsvxcCq/KbnTlMOxmS/QG
 9EWy6S5QI7V2vdRA/70MHsADAYBoyUjY0Pgb+mcGQLxUaJG1U7jAAcccpfBvZr3uUM+c3o+Y=
X-Gm-Gg: ASbGnctMNKbJhA63fbGlYbHco9X7wE3vpfux/s8g0XZh61Bfez9/l0xWDUv+K6Z29q5
 DFVfJY1hIrg+Tw5FDiZLcxZ0Fnl7XTxRZppmwiv/tCv9V237r4I0rgc3a5FYvFdsBLzq8SLaAo8
 hFujJ1qzp33/jAausxLhJ8LtoPrswFB7UVHB/f/4XuS6gA2avoOthz5ScD7nUiTFRZU6Lj+7K7M
 ppZPiee0GRbmF6aa0v9IQCHgcNZxA7CKoGzCWOp15epFllFgI3boqGhDRRKOpBZljorNzS9zLQc
 3vytztKWCk5Blkgj7S8JN01e+VfTpyAoMaCROnOQKKHJCbhUDMIo8iX4CbYlub2AFLHX4QnJ0iU
 =
X-Received: by 2002:a05:620a:2a10:b0:7d0:a0af:1ec0 with SMTP id
 af79cd13be357-7d22995c589mr1782744885a.14.1749495282648; 
 Mon, 09 Jun 2025 11:54:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyj0Zi9Wm7AlJmus5lOeyDznWCCczyVFTC/lx3IzF8V10z6/pDpyYpLgHsXKeVB0xoCMPtOw==
X-Received: by 2002:a05:620a:2a10:b0:7d0:a0af:1ec0 with SMTP id
 af79cd13be357-7d22995c589mr1782742085a.14.1749495282327; 
 Mon, 09 Jun 2025 11:54:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772ab63sm1293535e87.178.2025.06.09.11.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:54:41 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:54:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] drm/msm/adreno: Pass device_node to find_chipid()
Message-ID: <hv5zpb66oynxm4ge5ugvtgfqkwukxjazcsutn6phi4ll4lpuvu@r3t4dti5pfri>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=68472df3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: n8bWJk40ugpx2JSvIXT6-gr62_O4iXZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfX1z66OrSKhrEM
 nFPpEhJHTTU2UqSUBp416HC3i3VPQE/xurMGRSXBV445hEOcPV8lU5sPu8RUCK204AK+LEBjj6a
 22fRaC4mW4A+d8CtffZxaYPWFSbEZblWGq5epHNW6fh/JiFeyM1T7hBCrkPqUEr+WWDXBn0+GbY
 MjF6aQk5FQpdjU7llB7DiuW1X146zY9yQmb99O/iSk690yCAJ4TwECmIIqHW3clUoiXkCjynvC1
 B6Blt35bD5Ir9nGqoAZ8N0aFewtppT/6yqYEPluqW/UeGAQngGavLEn3h/KO9lovkXSIM8YKvWQ
 2L9m0UU32EuDw2VOy2RMaz3Dv+pWX1rocW16hKHWO2sEKTAjc3Du6HgZIqQnVarwCNottmmkVsy
 U1iVukmjUQdbmSqz9czMRiq3ObNj1zsKqK9rUCsv/LkC1JS3b0q21UuhKPDaczAG+4V87y/y
X-Proofpoint-GUID: n8bWJk40ugpx2JSvIXT6-gr62_O4iXZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=760
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090144
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

On Mon, Jun 09, 2025 at 11:24:36AM -0700, Rob Clark wrote:
> We are going to want to re-use this before the component is bound, when
> we don't yet have the device pointer (but we do have the of node).
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
