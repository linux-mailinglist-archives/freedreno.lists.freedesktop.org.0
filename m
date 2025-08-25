Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82E4B3490A
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 19:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73A710E51C;
	Mon, 25 Aug 2025 17:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1DJUYCy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E4F10E51D
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:39:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFRRcm012652
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oIsZvuj3zyqTv/yqZeIFq35X
 0m+hZSGafrokoFxwjBg=; b=Z1DJUYCywhGvuKF3VHAarB4nGAQo5JCQzmdMIk/w
 jgNGeZU+w5q1LRcxOYUCeBj+Xk4EdY+Tho9QH5/c4gthlFqDk8H2tvsEQMLHTxjG
 u8XnK4Wp7JmR8QD7UBM3abGObz3CrfE6i7qvKAnSVhD4ZF07U3dHVIDN2u0qy4DY
 TBJy51dxvM3G2yF+9hWy/upcNPXZvzlSxlJ8DxY3nQZD+6Y3aIIhG1LnVEUNq2Vi
 KK1eNBpBNG+HakaUvpCpp24OF/SDtck/B7EhzJGBRxV4KmFQIeOgGBMoSBnDieFq
 8YUTzpqXQ7MW/1uy8g6Z8qyAUdm3uQfiU4z84yzbVc3rzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpp33j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:39:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b1292b00cfso46002711cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 10:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143576; x=1756748376;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oIsZvuj3zyqTv/yqZeIFq35X0m+hZSGafrokoFxwjBg=;
 b=k8pSiuysfYw1c5fOhO+utCvhZqEH33UBb7ExJgOSsFBvt6J5dJgQSPZygbhZSHbe7T
 0YOkUDE97Gc6S6l7OFBnCXIyq6p4Wd2m7E5FSKyJcb+l0gCQ5bqlfdlpeVBRDAP7YuqJ
 0CIEn7c7g0LvooStf0gGSE2Rppknp3rOyfnWqX9hrLOQ2iYbNP64ph3P9jW4ge0I+ugg
 vSB0knPgvPy+ZrktNdfuVjkB0mSCblkc/ztQmSPxefHhCo/YgdKSsneu9rMjTcJsx8Bd
 88UFyHMrXPdLvpwwdAGsIWR1McUQpAFwWvJavPkyWXOj4X4CGEpI7TxtXSAutCGC+oQB
 Jt2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2DUyGfC77RZyZ4vbggJgIjQ8291KHoWXWKO3EiFSUe8boN9uFmqIMtgoMn+gKYtZogpIIcMqyP/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxczZfZYZlw/qtftMe+Zk07WhKz0f8Ni+UuHCOcDgqT1BdSTePo
 7RqZjjzBAaHEOJrSVFmEEam/EsPprpK3T1JPvb2eeudX9O0V0HrFbOAd11WWYe60IgD5+uL+fKx
 +/TcOmtCMCRzY9HBQenb5jpcAitwGWLksDIQuSTFsKh5pAUoKS0UVdfwUTUdkqIiDDF70e5Q=
X-Gm-Gg: ASbGncsm1N1EYt3IAfFTM/Klc9FjWfNfDTSShRG3hQf8/hP6GuH8sfmTtpcFYFpR4FH
 CBgsPsFuC9Uq8ybcCOLZHAiJvsVXmaMPZqYBsQnM3I8d7IVRLCWM3XQTpG7SAoKokfX7BX22cHs
 SnpiOJ1Az4qDiUyTesX0BURKMOCvkL9w9dDtgAzpxkpiGdg/tBuFIzOplMkHYkPUMFADtod8ady
 ho7/s1h7SWCYeZ+oLNTHMQUoABHbBgPFnZYr3boJsi1IR+UlCl5gn8EKfCctPjQL/5x59dybqmY
 027uSAxIzfhM/yVRG7satLam1cfNwi1SkEquboUSRWVb5ywHZuBW8aSFEJLr3ZlRTO3umGTCyxl
 gsQnaBuZDbnX/EoR4sSR3WiBdSr9P+pM7jrWVTVTy3gRzXzAbbamG
X-Received: by 2002:ac8:5e14:0:b0:4b0:67c9:fd3f with SMTP id
 d75a77b69052e-4b2aab20a48mr171262981cf.51.1756143576199; 
 Mon, 25 Aug 2025 10:39:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu9ExTFKxMITOA8Nf6hgeYhq40ePHq4NgYZNNSuNB7d0GTcBRxbB53k6tbpruIYLU+/S4KMQ==
X-Received: by 2002:ac8:5e14:0:b0:4b0:67c9:fd3f with SMTP id
 d75a77b69052e-4b2aab20a48mr171262501cf.51.1756143575665; 
 Mon, 25 Aug 2025 10:39:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e5fc0c4sm17741041fa.70.2025.08.25.10.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:39:35 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:39:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 11/38] drm/msm/dp: separate dp_display_prepare() into
 its own API
Message-ID: <rsywfefrwv67umbi6xeybelsu5u6xqyklvtarnoluu5mzz5u5k@bkexqpdd47ew>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-11-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-11-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac9fd9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=oD_kwPJ1Vc7tpeseQ3MA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yxGC8A-7aIJONGPwfuSvPWJS9IiM2gib
X-Proofpoint-ORIG-GUID: yxGC8A-7aIJONGPwfuSvPWJS9IiM2gib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX4iCJ90mN41jK
 b2R1K/jsLCwQI9c4APqdA+wkZtuG2BBoDyd1AsEZTojEmRsY1i8w466p/B0kt+hrEUq+MiClNbR
 YrLiGH+WdskiSBnjoDCqPArB6/WUPM6PO51aZjUyllyDPvOzV7MuOhDkqryMFXqy3SsFkbT3yi6
 9yX7wIn0gvsQUpwSbozcFJhfdm2aUXjqdR1WzgyUrTz7UJnXXs/W0/uUZ5e50JPDY+K27vhHo+7
 Gc7JEeSO2BeWXjigC8yZ2vQGGET7/5jyTdl8UrDK1LsxjYvLFsq7phvSBfzJTUtneyaXQWTfxvX
 8NveqOoHv3BI2ikr0OT03fUnUnCIfV9cC+wiQUS1VV4v40lS62DFtBkSIIoFkeqmqh3ENooyAty
 3uEWDB8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:15:57PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_prepare() only prepares the link in case its not
> already ready before dp_display_enable(). Hence separate it into
> its own API.

Why?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
