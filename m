Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541A4AD213B
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 16:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC8210E3CB;
	Mon,  9 Jun 2025 14:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="diua22Nr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E72E10E3CB
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 14:45:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598Ow4m000792
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 14:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NBT6vmPj+KP/UP2fTnvuSaVe
 UdJIIkjYpa/Jy0VgFCY=; b=diua22Nrrjz2KtZChNi3CJHaoZfxHmKMpnF2/8ac
 6Rw6LhOiZVXiF/TSccUgnd+psfzrBGQbNoNcgoHQRClthbOfTZxU6uvHmZz8rSJ9
 S/37AYyD+P5ek5YVCw6K2UlOVIOS1UXWFYpnqFI4JKa+3Ntoiv9NS4wmW7g1N1kC
 wcQ1ZQFv7ShlfzRhhAL3ycdOJSZfYrkCcvLEOR6liAoNl2c8+DOtkOTs1+rJWTXb
 gNVyWXs2WRvYEekh+J9DDYAvsD1E7JGAo8kVJw81IdTdOuBR8P7xhmqXNM96hMID
 ufegKKs28t7faSitGANf6SQy9Fb8+vSM1Mpk6LonITL1Hw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2t93f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 14:45:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d3901ff832so323005785a.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 07:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749480345; x=1750085145;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBT6vmPj+KP/UP2fTnvuSaVeUdJIIkjYpa/Jy0VgFCY=;
 b=GC9/04i6wuUC9hhjfrwyAeRBBBL5PP/kHDvnmEAv/wbM6gUsx/fs9PxHv9WYrjFtrA
 Qx8vwPqp3IfZzl1sdySnZyNVxQq0N1UhPw/I+xW7VTcbTG+1EqZ8VGTXVt+FcsUWt3sp
 527i3ve/qbdAuG6GNaQ/udB5kEGKY8PaNZPZ5nyYJQAkf7sys3U5zs8EH2XfS1VJWrIX
 Mtp9QIQWdFooPVFuVTG+88klu22Gz4AnPFi+99t4KC9xkVMCZNTKPPepcJ7UwRrSDwUh
 5feLcL5fJ/wXvJpAX03QVMdiey/5rzKFXiveUcWiiORmG/4FXHhVI5W6fEyaCt5R9F9i
 hZaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVju1hKcHkM8DuCwa56bt07XuaMTvd5OSEbOwYXkYpn5XeaARCLqVGMOoanKbxY2Z/eLH4lGpACFWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeMYAvLyQ67YUZTLOPKoLbUA3sfXUd6xYair6x19Gom2vacsXF
 pKtAMwJMe5aakhwuNQFP6nH2jF+Xg8I6Hn9ldbkRKX8SV+C5e9WP9+44mUxL17CASSbyb3LJ8Bp
 uL3otAhFl+sqcYCweWhdFMNLnpfvUnpxKw1jP9oZAtK+RADRulg5z8aG+EKQWWv1B3utWsS4=
X-Gm-Gg: ASbGncsdMvJU7HYw4GU5x/MZvRzyvHyNhzZMlRpDw+NB35PLxAkagh+DLQNpUTvb8H9
 pze156ZG8ebtxmccu9TKfGjST71Bb4Q6JsSXRmV2ff+OFWLkvOuWnmpZT2gVa3P3Q/TNMJsLkFm
 m9+m+U1C601atqCXb37tKBBb+GOLkD/NlxcBgrv2dSFuUAHStfTbl/McxnXfp/Q4hcc57JiQM8v
 kJVxPQPog5Pb34gB0D77RCD8LnqvGOozID0uZSdqKObe5Eubd0+vxMFL+mI0/f8XslGLF7LxI+/
 un+yrtj72OciCSvzYe5NqN2ONnOyzPCVHNu74ZXiLHEOyAY0XhNu/yDHOb1kN9DwfptPo6yRFBN
 loc0quTEJWA==
X-Received: by 2002:a05:620a:1921:b0:7d0:98a1:7aba with SMTP id
 af79cd13be357-7d22987fa6emr1692497785a.17.1749480345313; 
 Mon, 09 Jun 2025 07:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGd4u+n8gacssqQ0c7Zyx/dCkKu8dSHgSYT8DFdFzuA7K5Hkq7N50B9znPiIOhz5RFhpAO/w==
X-Received: by 2002:a05:620a:1921:b0:7d0:98a1:7aba with SMTP id
 af79cd13be357-7d22987fa6emr1692494085a.17.1749480344848; 
 Mon, 09 Jun 2025 07:45:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d7796sm1188959e87.81.2025.06.09.07.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 07:45:44 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:45:42 +0300
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
Subject: Re: [PATCH v2 37/38] drm/msm/dp: fix the intf_type of MST interfaces
Message-ID: <kbpq6edonoorgukf5mybnvz4sm7aiefqhogp7k5cmyhy454wii@bk3nw7ivssjx>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: Z-LpfzS-5QhKGXB9pHHVj1b0m9nJCtBv
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6846f39a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=mIDvE2fUgOR8az-e3JcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Z-LpfzS-5QhKGXB9pHHVj1b0m9nJCtBv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOCBTYWx0ZWRfX7E1Uvuip3/oi
 00GNc3PqwShQ8VHe7ZcgQBZcFTyJKhqXDCxXv6MaCj8ef+fWboZQ97BLcYQ0t/3qJ+8rkNy1X5o
 yrrSEIWJH9+PdZwWZa1L0Z+lFUJ+B4o7xJ1x8M2r+wIRqtyOUWAiZstMXblS8GovT5Q4F/8zxCU
 qSqI9XnmZWm+rDFZaMKNgvJ9/COA0I8HsHz38VLgr7Nnb0G0TdyDp4kl89/dBbUTCun6hDrt6ye
 NVJc1Waye/wdY3MGd21AxwFEa9H7es7A0PnR/3ZWMtxCP9d3yL8zWMYsh09HDkrsixUF9V0wiyc
 zqIf89uw3gsZWDByfaiqVTuUQexp6dNYke4rTCkSf3wfnvoMd9snmiokK3kGuWWhQHe1g04QQS4
 cJP7VBNWEqcFGkCY5RJMGSwDClHoSxDa25B+/HMvmwR7Tay6wexukAhpkozqpSMnaX8KqqKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=813 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090108
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

On Mon, Jun 09, 2025 at 08:21:56PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Interface type of MST interfaces is currently INTF_NONE.
> Fix this to INTF_DP.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Please fix through the whole catalog rather than just touching one
machine.

Also, wrong subject. This is not a DP patch. Please fix subjects for all
your patches.

-- 
With best wishes
Dmitry
