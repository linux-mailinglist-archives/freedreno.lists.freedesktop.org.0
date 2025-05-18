Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8573ABAF23
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 11:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B4510E273;
	Sun, 18 May 2025 09:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7Nev6nw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1603A10E1FE
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:57:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6rTDX017500
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xtlsK26IRXZ/58NCN1CWrrVG
 lERGjp9AXyiJ/lMq4CI=; b=n7Nev6nwXxcRCXVjKKHTZtKH9pIzHQP5lZTR/d8+
 xt88ESg/dqQq14Sx0fgGt1fjz3nZUbII1KYtAsG9NIjPXK8xZDnfB1YQndTsf+rG
 OV3kJHVtMBhQnNs5363lk3F89YkbndWyfgWb8ummFF7L/FrR3O1vKrXuOD8NZyFD
 5mZuLi4cZe1Kei17TlD0JDSR2w0nfqUx83FC1RQLHc/l8+xYat6Drw/1o+Is1Y6Q
 6Fm4o8uzuiR8TVpi9Hj28HHuvDk6aQQGduyKqB2uiig0X+/s11P9zL6raZUdj4PX
 dm4c+rxmxKlvs8JMww3lhO6Wq4q5iS4iAsbYudh1Carq/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyhtpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:57:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7ceb5b5140eso134777685a.2
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 02:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747562247; x=1748167047;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtlsK26IRXZ/58NCN1CWrrVGlERGjp9AXyiJ/lMq4CI=;
 b=f/Ak9UwhHNr614z6iTobBuIdtkw9i85sJl/ehA+g8vK2GbKCD/3Qf2cHziu5nq8XS/
 534N1uLEF8yj/5HYhXAHRaW/jRLA9wJ26O02DuLXI7kGeWdA5a6aGN5J9yuLtJT3GNZ6
 qlre97/IgqIuBxjJ8zPHpbHMe4v4j5IfCQiOjQLgrfAodIRYSrsJJfkwh6oaKk0++X7q
 FJoM43G+z27pVlX479AX8ULJ27xw6xJg3K4ECPcnpRhsPBO+2AMydxPlJQNQxMVADkN/
 STBy1hdM1pasvnmcv+f4GIMZRuzx6NU1bvxkpwdw8vogGFj76BhBR4nsnL8fIZi7pwp5
 AgHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHvI6pa95oP0OpB7o6s5gLoXccNVPOpt1C+CgJzxtYMFih6c4HgBeoaefCrQCwFlYAt1wTgAtBjZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuV35N0//z0hNyrRJP7Y6pWptOFKopsON7rp5Uw02kYIrbzDOq
 17PJS6lsrRZ9wSncNQK2r6OKc5EYbUR1965xduBIjOk6N99XkbHBergBBFTzKk3/BNs0XbGusGv
 CGJzDSlQd1Oxn5XPMSv4JQCMxs9UcyxztoSNP5GD516qC+81nZ/eKedyCs/79EbN7keY11I/tU0
 dSdDU=
X-Gm-Gg: ASbGncsMGJ4aHmYSw1YHsAkLlu0WeNdCSU+Za1JENWqB6bOnD+S8FHlKinN2k1p9hIW
 RMzaRq3vcNgO0e8th6eV/cCkNcDq5qZThqJLC45dZzuJFGhAhHdYD0Oo5P1PT1TZSZvPLYqLRMF
 wPzlig0p/PDTvnOBJ7Cd7uyTEBWfYNCkeLEY1Ml3Nl6V59N2FjU6xhIgZf7x8nTeoVnIQTMgKB7
 zcxRufMgjxHnQipUCQkZq2jlf58/L4cjCvF9SC5Rl63rinrsTbQA/rnnB0xbc0OwrgAIP7MRsPC
 to+aR8dLxfZi2CSQE+K0GlY296G8ljPd1cEvH2W4vjKYi/sQItpwE1MFb5+aPtral9A22Pa/Vt4
 =
X-Received: by 2002:a05:620a:430d:b0:7c5:5d4b:e62f with SMTP id
 af79cd13be357-7cd46779caamr1359734285a.43.1747562247338; 
 Sun, 18 May 2025 02:57:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ5pBjRydjX6p8CyddzYdMdBy0D9FOBBlqON0ng7sKi7sHV/ur38csJo7tBnlIEVgInmOAjg==
X-Received: by 2002:a05:620a:430d:b0:7c5:5d4b:e62f with SMTP id
 af79cd13be357-7cd46779caamr1359732185a.43.1747562247003; 
 Sun, 18 May 2025 02:57:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e9cb4d69sm1260695e87.21.2025.05.18.02.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:57:26 -0700 (PDT)
Date: Sun, 18 May 2025 12:57:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 10/14] drm/msm/a6xx: Simplify min_acc_len
 calculation
Message-ID: <cet4mrockbsa2lwrjmpvqfffhlk4r4xzbfoiffuohz37oaklsj@6spwjrcyxf7r>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-10-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-10-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfX6Wn72buN+IJo
 s3AKlDJ79T2Gt7nAPfGw4PxDiwPL8lcJouIQZjGEFJzPpXzj6ObxZzgZ+kCM9wgMVNddEMF+HMu
 iA+uroUPaP/ZPThgauEsLMOXY2/EovyZ68UvXSqpbzLOT8hPxQB/SlR79QpKjod5mIjS9EBa9ci
 waHEt1OrJJNInL/yudBlN87ygb64lInhUtNuhLdjmz6FaaLf1KtSLumJHrS3pZ2mDfpT2GvMkbq
 PL+F18VSWuxCtIZTSkspe/tnPIMQB9hKrW7nSeiOpKkCXEfjr3gLzvOuJ5a2lqWHrdunbc5y5eS
 49zj+mfq/m7f5EksVpmFkkEAbaP96DftCXbJ/bL29tVjeCy42009cjwVESmeC5EaLUToFQ5Wvsa
 uL76n9Jd9DpMklVlT2aRgTqQ42S19HCZYYlTpkwZf4lp/1DGpnZLT+IZCLoCiq88jFlN1CYQ
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=6829af08 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WrN7u6T5calBdp3Od3AA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: xse4ooO6DXy3MaDEisyWmHy7xOvTXHDK
X-Proofpoint-ORIG-GUID: xse4ooO6DXy3MaDEisyWmHy7xOvTXHDK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=950 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180091
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

On Sat, May 17, 2025 at 07:32:44PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's only necessary for some lower end parts.
> Also rename it to min_acc_len_64b to denote that if set, the minimum
> access length is 64 bits, 32b otherwise.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

MDSS sets it only for a610 as there seems to be no UBWC support on the
display side of QCM2290.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
