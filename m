Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91107AFA0B2
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 17:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470C510E22B;
	Sat,  5 Jul 2025 15:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddY1/DNz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13EF10E219
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 15:45:34 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565FiP3L016552
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 15:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RqPSWAF8btgqGQx2RmoN6IKt
 lOrg2Ps03GpJ9+btV+k=; b=ddY1/DNzQl+wCtYQrNwLVGwgZKGibGWLuLHgpgUg
 vAviCZV+Kl4Nnl73SxPBrU6VXauvAQkVXiCAWAZa16BdkWOuWTKjUOSVESTeSOBc
 8/68GsYyq5LD5aXe8fVCZLq1Y9A7fdV17Wfss1Jr5ZdsW/SFEE2M8gRSs9BqT/Ai
 jhoy0eAwc/W3kkXpo2hqf0NXuHa4MTMbX7s1EEIdC/jUD+8NY+GfGiV8fraupkFX
 IWP3sDVQ3M9ar7ebLaZ7MuVH6Y40xf2zRNemdVs8YlMw0FsNjCJHrZeau03UUngr
 8tWrkDCQi0BqvKzTIhtDGRFi9X678el1ZbDFDZUYoHhTzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4x9e3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 15:45:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d38fe2eff2so248530685a.2
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 08:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751730333; x=1752335133;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqPSWAF8btgqGQx2RmoN6IKtlOrg2Ps03GpJ9+btV+k=;
 b=QE4750tFsEGwQH6J++q/opozBXFmRZdptBr2GySIeUIUvVhBQ/nE+Mt/VxNPdOnwv5
 f2pPek9FbskX5CQkfPqbwpxyBL3N+WC4ye/jbm9SBqpGVwi4lc36ViEbyFXVHu++oR4l
 BYx8OwAsrtLdgPZLA/qJqYmrR5vZpaOBCNHsxDYY692ttKw3Ip4pGbZUmAKbuggpb66H
 AW3bg1YVMcPRjWVA1jQTjtYRn8Zad8WXbNS7XFp3rV05MnXHDghHXz0D1UnmQ3zh1zFy
 4F8pZjxMbpSYkDFKiPCzdGqpgoNbSp5yO47ylmFaajqwxrL0ifVKBKIGe998BMMAPSk6
 mK8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv4//xfLoWElcO+M79JLNbzKl/sO480Gl/PuTN5jT5fjCzlUGmBtzLxBTeOcENDXRhgcCyE5iTrSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpmIWBwODqQCxiq6/j38i0VHuCooc60C/ftTFSqqzYAsQ9BLEa
 cesr0ZIHuzMcvS9kM40YE071SPYWdqKfM8RbAIN44AtkI2xmUNLX7VlGb7B07kCcxU9z/OhrETk
 UFYDfHkvHd1QEz6N+cf9PjyUScL9oeuSr+dNgUzc3qQOJV56IcUGTY1e6zvuyJ6GoRoNFc24=
X-Gm-Gg: ASbGnctpzfmQNJYHHprfX4wqvb9NNiqrxEwvgmpv1GXiF7WITYFHMC3VztU9mmgi9aV
 9YpoSCDYnHkaSGnIHNS70Nz7cgu4pTYxAvWClGZ2xk6gXtARzsa51BkA8qKRpd+fXpbveGdwGDS
 ezo8Z/ompLZZa1wcssHTP3nCtWlhd0CNpF8jx3FFhoaK1ROHauRowwZXQtLSUuTolk2c5gwjpJ2
 MWRraHY/5XrA8jRh2Mo8cPK0Knb5j9lP51imHZGKXhLIiuP/7uW+e+e2rW/XOYK9L+0Gwp7aV4b
 VLO4z8I47ZUvNRaLoSaTeWdKfUHjDwaqvK0nHAzT9tw8cHyz3YlIENE6u/HwU9O+arvegbq3IKq
 /DHjDNGl0x3giZRMcBo9k3WMkHOkNz7HLBn0=
X-Received: by 2002:a05:620a:4150:b0:7d3:f3e1:b8db with SMTP id
 af79cd13be357-7d5f10fa23amr305358485a.31.1751730332902; 
 Sat, 05 Jul 2025 08:45:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdQQO9z80uLLq2RxC8dU/JD4SNPSo1XPiRPBeKRm/HHhGqxbe1NBor478/kV8KQ2/9nkaUcA==
X-Received: by 2002:a05:620a:4150:b0:7d3:f3e1:b8db with SMTP id
 af79cd13be357-7d5f10fa23amr305352485a.31.1751730332313; 
 Sat, 05 Jul 2025 08:45:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55638494f06sm609028e87.121.2025.07.05.08.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 08:45:31 -0700 (PDT)
Date: Sat, 5 Jul 2025 18:45:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm: Take the ioctls away from the KMS-only driver
Message-ID: <g7vusfodm52goeid27twl7ocspyf6zfl3zsxfo3jolhjgh4nng@oz5m3xmlj3pp>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-3-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705145242.781821-3-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNCBTYWx0ZWRfX73Gk/fSjd47V
 hZu1/H99J7vXNOIz2pEKYZtomCQ0UUtwaEN6cIu+z6cNNtTj5TjhSZSojQODgTu8hGdq0zppFFI
 PiR6XukBgC4jsSk2sj9eVGxExSBJTx+G13J62/4onNR9Cg/uCGLX15gAF//vuKLysy72r0bl/8X
 8nj0IMEcO1U17rrnhchSUi5+DpGEGIsSu51nDkDNad6gux58kDYln27ccGjVt+6Lfzu9sbXhIDy
 aJZKjUPlZvBGo9PHzH2OGF4hOVO6oSSf+jOPCmpbG6dkGoQXbHohJq3M2rRJD3CC5rTnRIKvAM4
 1uZESQ37/fNd/Iw8NYbjPE1YfZ61pwWBbTVus1TH/cOsiTfA+SZtHb5AGau/LwFg3lJQ4p9Cpv2
 SgNvuJSZ7Wq93MoAOYUdrpXsqVsBYHoW6te2E/zcqLnYiwa8FI1vzP3/0P2WNAhLRRcWZAPL
X-Proofpoint-ORIG-GUID: c_Uwk9ZidkAPa2rbqiugwvzu-GNXDUfV
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=6869489d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ff70caK0HrvyZWHSuAMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: c_Uwk9ZidkAPa2rbqiugwvzu-GNXDUfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=704 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050104
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

On Sat, Jul 05, 2025 at 07:52:41AM -0700, Rob Clark wrote:
> KMS-only drivers should only allocate dumb buffers.  The driver custom
> ioctls are only meant for the usermode gpu driver (mesa), and not for
> general consumption, so they don't make sense for standalone KMS
> drivers.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 --
>  1 file changed, 2 deletions(-)
> 

If we need GEM IOCTLs for the KMS node, we can think about it later.
Let's remove them for now.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
