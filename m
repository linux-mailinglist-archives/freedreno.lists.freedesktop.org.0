Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B82BB260DD
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 11:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BD510E296;
	Thu, 14 Aug 2025 09:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4iccqO0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC27110E29E
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:28:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9J5Bl020811
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=O076QscBlfaSz8F8rEYXMUKe
 ydobwM2fUce6AJi5pU0=; b=c4iccqO0EpYkH9FlIOWuAAX4vE+ax/m/JH/fRlbb
 t9eJgwcJ+5InT7JIM2Txed7ag9OTSWtkpyrYw2cv5tr4C/Bj9nMemtKdTxly7w+G
 6xJsDYtZVXn4de0Ch6I6PiCvND/NVK6cVDFb/14nB+Hdijs+xNpcWfBRkTb6xFWy
 DB6Tfjz9+fpsrvF74b9+m+n2saOGXxjoOZI5lXpy5vmAaPAUYirCnvg9IWUZvHT4
 b+VazyBmbJAXOKNh+PwVcEj6816hGiMib3v2UH3n/dk72oVu23tc/sqGvg+JlcXH
 9+5aBS/XHa6jg8uZARpyzPpdOoorP6E953G4MUM4yzL3sA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9syc7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:28:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b1099142e0so20379891cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 02:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755163707; x=1755768507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O076QscBlfaSz8F8rEYXMUKeydobwM2fUce6AJi5pU0=;
 b=KwZnxBO/dG4+M6Lcfws6cu3tunDskkcmLZGipP1zv6i0IvSgVLYTkt7E6ER25l1lH1
 3WQjWvDcVTe+moKo2H8qq2Sdq+PQ3r/opQxtBaFGbddRKtWKRe/vJABwMTFNoCi69PvM
 Y/GHzGLw2CLDzUeezYii6ZWOoj8tdbAbfGfkSPp5Dm8c2Fn3vQLpdAvgvrsZFrkVaBrW
 18gPWyfVmYMepC0RWN78NYT/eXnZeT8LQzBmI9Hp03SkaGJMYYKCG+ITifYKy4uWid6s
 6uWWSQow4/9oV8eLseQHrKXkTp4qzrWl4PNlcaZ03modfaOyMXrsprZULa8AehHKnW6f
 WlZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1sVXKuZOFKqJz9Yw11MTSKEE9pYOsOo26IPZdE/iZbRnkOvwssq8Hgqtvu0bObGX9QE6rspAtVkA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL0BLuRmLF7HjbxA0h5OLVbDB1uxlViSyAifjieo+eKIeVw3oU
 4ciUpByT8vTuBv4rCNs+I33c+Wc5W6cOCR6k+CYlcuzjIrOk4uw6UljOZY6rBZVgGM8nvQpaKV6
 5ghIi19rFQvbP9MPh/1RXxnLOF/4tr+chAc4WWXHB0l7xYwLHms2Nx1QCazMRd9Zto27eBvs=
X-Gm-Gg: ASbGncs3NqHM+bC5P4P1mpdwC5laDTIJNHvtb1TVQekE0yqWBEuYN4Gj+KEMLTqzc6m
 fszPFRMrZ1FLSGt+oYT29lpMTNoDryw7/w14a0OVVS4gaXU0O3DbKSdZsYSuXfpwX0+eRUxN7/F
 KjB+f0WX/M00GEsUdBrltw/eGEvbyrpfUXVHta0DVYkkf9+ya2mHli3GhcypIaM20/SJSXDlWMI
 vvYQub7h5E059ZQpLIgZOPrbfre8Om9NDqqI5NjGXwPw/6w2uqBRdBES+YPTeJLNbG8VBtupK0h
 AB2QtgLUdXEF7xpO820gR90v6RG/GPpEWDc8rb/gLACmaSaNQaB6QCWkC042m1nFnDrgwnlWkVy
 2hdc8ABTc92Jis6EEtJO6Juffaw79x0KcRFUjkU1v+agkqsA1Jo3r
X-Received: by 2002:ac8:588d:0:b0:4b0:7989:13db with SMTP id
 d75a77b69052e-4b10c5ed878mr20121331cf.58.1755163706760; 
 Thu, 14 Aug 2025 02:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3MUHvm6rtSa8l/GeGn7RYGTzj4ND9ReLlHxxvcNHQJymdlM1Mf9CYxBThDHTsoL8aM4maXg==
X-Received: by 2002:ac8:588d:0:b0:4b0:7989:13db with SMTP id
 d75a77b69052e-4b10c5ed878mr20121041cf.58.1755163706254; 
 Thu, 14 Aug 2025 02:28:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b889ad021sm5649676e87.74.2025.08.14.02.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 02:28:25 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:28:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 32/38] drm/msm: add support for non-blocking commits
Message-ID: <vns2bbpekccowbu3ahg4cnvhrbfk3yc2tvu7o4n45gpn2tpybp@w6gmsve76erp>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
 <rznsg4feyxanhvggxtebilg3ukbcrv3xgi4f2ijadjqaeqfelo@ogib4gythj7d>
 <a8458790-b4d8-4165-bd6f-00497a9d0457@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8458790-b4d8-4165-bd6f-00497a9d0457@quicinc.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689dac3c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Z7gkRSVo2wHhsan7cAUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7BUJFyD4hrdemDK7SLTbPDnP50nTnAbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX6FTJWh9XDkwQ
 q+kg5ZxjWjUyywAsQcrhxibwmu7Wlrx8aHieMwn+xoCtPiQNNJOZoIbZGbZo4f5yik5GmUTVQW1
 wfHCYORTufp58XYxT4fRn2H7vFCQRT0mTVGIVIrezB0N3xIvSoPy/Gd4hJck9gwUviqKKMLH6Ij
 h5UEfdqD3l6ta7PY5Ml3RuR0JLGeyIH1cpiYOJgWIrfjqM+mXp5o4kJaSq/8dQ62ZmsTu8bRVd/
 tBQ9xNz2UrGOPgkWE9oqAR0Y0Nue7aL17Gw0e6/+GjMAInBsrqeE5ntYdCbDlSPDmtxAjmNgAkd
 w2yN4VQ/hzLUrXwywgkOQrSHP52hnHE9sRk8TbHzphT/XTfQso5yJXLHQovx7dwWsfW+fh0kTvX
 pTv1JxH9
X-Proofpoint-GUID: 7BUJFyD4hrdemDK7SLTbPDnP50nTnAbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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

On Thu, Aug 14, 2025 at 04:54:16PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 22:50, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:51PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Hook up the mst framework APIs with atomic_commit_setup() and
> > > atomic_commit_tail() APIs to handle non-blocking commits.
> > 
> > Were non-blocking commits not supported before this patch?
> > 
> This patch only work for MST case. and for SST case, i'm not sure.  I see
> commit_tail() called drm_atomic_helper_wait_for_dependencies() in DRM
> codes.. Hopefully this can answer your question.

This should be a part of the commit message.

> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/msm_atomic.c | 3 +++
> > >   drivers/gpu/drm/msm/msm_kms.c    | 2 ++
> > >   2 files changed, 5 insertions(+)
> > > 
> > 
> 

-- 
With best wishes
Dmitry
