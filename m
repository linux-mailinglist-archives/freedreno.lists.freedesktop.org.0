Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1951CBFA02
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 20:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB2D10E272;
	Mon, 15 Dec 2025 19:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5HhAvWl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IX+0UpRY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6D210E275
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 19:59:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFBSqOv189337
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 19:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xUvRut4LPhcQJt6yy5jfSYri
 t1yQjmZhCtes6R+h94w=; b=N5HhAvWly81DWc1ywucHiaiDbJNdbpU4q9DwOJEZ
 D7v7QfCtRtHEB9D2lNlKd2ghF1lmxEQ1BHxuBtqPK9nrPuTKNKNpUVzSVO2z/Vay
 VeZiIQa3D4o4w8w395LsQ16cED9Qv92XHMIfzmmZ2NgK4lkTq73QtjA/iBAPghts
 Q70EFbGGa2q9nhuuF7B/ovMfPFrSymyh0RHZRUDdNh8DwH/nOc0m0yxQwEzbMp4q
 PTfN9gbU60WXYxA4edpAuCfttLD4HKbu+IJVmuYgC11VN5unja+ZkL9EJHGZLH9b
 mQgbjJYEdP5K9HbUAJsCpwz9EqoYrrIxKGlm9N56Tqc1Dg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2hgaseaj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 19:59:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4eff973c491so88423831cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 11:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765828778; x=1766433578;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xUvRut4LPhcQJt6yy5jfSYrit1yQjmZhCtes6R+h94w=;
 b=IX+0UpRYEl2NvN92twVOr74qwTKztLDF9SVixdUz7xO8Ll/d55B4DmFlKCFDM5tmHk
 5f27LNlW2iGyWUvBH8Gt6xNmflFdifRBrlhZ/z6TsyrzK5XKUpJdjKo9R1/OMlwRFvd3
 SFDrKZ6WdgSrc/44JawiK57FOUoulqet+6vxirg729uNAmr13oXRLPRYZaHI8SRrMpZg
 tK1di93k3YtuQv1u1/cyjNyYfndg0ItWrTttE9Cx53Yy5uf4bZJ9NQ5E5mN6DiJGd7ZV
 LL705ZmE3UG8JjbrY7L8oQ+HzkAs0gx5NnZ5OSeiz5qp1FJ8sZ/JM44CTJEUj91QlXGK
 ZixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765828778; x=1766433578;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xUvRut4LPhcQJt6yy5jfSYrit1yQjmZhCtes6R+h94w=;
 b=S3q4HR6ilzbRFUgeRrzddlRQlT9t1BmfzfLivIfWos6CaAWd0Oqhq/uwo6LgzgXjFg
 2sqbC+JayOnfIiYvEkYbKKzhRSrYnaR6dL9Wekiz8W4k434lZFTAIHOqW9FqXfo+QQ7n
 2g9CkIBGJPqVo1UIVRNGC5ioFz/QpEBLpiEBd2FKWpxAbVuRx82VhjBw3mEiI1MpUPHC
 DAh0NnusFddqXvz4JqTX5WCnA8yGPq5tWHfVZdSiX0ENzhOnDfvQhwfiimDBhdyGHv9D
 FIPEHTVPdlxCkx4wnMmzCR23ARtsrsg797rUbwRDS6zffPZ2JzU7H8WFK5TCbUr3VNyf
 /M9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXajQNIIOyAosDl1ifqGrzLJhbCf2WV7/g2fnYXpy9bIJjClzce2w/hq/7BLftevSPPvWayGzjFe9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl1+2oXKfEjVOz6h7IpTvnZMGSnSZqwkIW0nRHNAk7uwQ5EApg
 3pll7zM37fiN0bT3KrDFwl/WHqIt+opxnjUWYHZ4S7BJBRvMPMCMiOb3ZUfn6ohflbZrqGyY0W9
 Phn9sThXY/HTgUyMXwLodtplxhGsaVr4hRMq3afS0Bd3OKPKhPs9XflQ4KCHN3Lbib6s7nKY=
X-Gm-Gg: AY/fxX5Z7f726GMeQkRWpd5MlPmYAEIBEp00VZl6+mmpZGSGD1z9TpStm5KeY8W2sUz
 vjYRFbPY4s3gXd7ziSYO6rVnEAAGlVEJzfWwjmoO3/tGNE0qLYGwr14dbTD3J45O6PYIoAoBe5t
 lr/sUzFJUtDOJ00WmucI6XQr+Bae8gTKn2E9rfoh/4ewacdWymOQG6pLFkEanTr9shqffl0RyfV
 VNwDO6OT12Yh/DWFBHJfd/ys01g2NULnGhAefE26DE/xKSYeBtIMbKpL4Hl4uZsnikB6VJZw9At
 YhatfRk4HDeN1mRhIbCtxJlm90f5OgQKJSDZZ98HhGbTpxmb3b2V5FPBP8YI6TzKgGoROcEQIwU
 /NvBgMHH8APHVDNfEoeHm3zJI/AAgBM0hSnY5JiLEN1pxf29VnDodyw0FVUVE9ipvqeKjle3esU
 m5CJ1bMJtWb7G1tfLk4blj/W4=
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id
 d75a77b69052e-4f1d06121ccmr170372321cf.70.1765828777699; 
 Mon, 15 Dec 2025 11:59:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqqZpdpk/LAjsUwO/CuKVnRywZ44iVAnPHYSr7pn0xdNytnHiFeJJWTaxDzbgkXOhzHtHKLQ==
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id
 d75a77b69052e-4f1d06121ccmr170371811cf.70.1765828777171; 
 Mon, 15 Dec 2025 11:59:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37fdebe61e2sm31399611fa.7.2025.12.15.11.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 11:59:36 -0800 (PST)
Date: Mon, 15 Dec 2025 21:59:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 08/11] drm/msm/dpu: Add interrupt registers for DPU
 13.0.0
Message-ID: <rs6cvhftyxh6apvofabt3jgpbguqmfgaq55jue6jaddlfjpbga@sxhofz6qhw3s>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-9-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215083854.577-9-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: y-yW-pM8GqAi-d9isiynK9NUzVCFTTms
X-Proofpoint-ORIG-GUID: y-yW-pM8GqAi-d9isiynK9NUzVCFTTms
X-Authority-Analysis: v=2.4 cv=GpxPO01C c=1 sm=1 tr=0 ts=694068aa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CTRSWpIYyOKnzFSy8hkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3MSBTYWx0ZWRfXzWzIBIOSL9q7
 fKAf+aa97CRePOR6dwugGjnq95vgCRK3t7Pz1d+E01/+4srKkAuQbmFaXas+KNkHPmPk3bnowIL
 PxIQzIbb6+GosMGprn4qRHueJ9OVROY+MeB+LQP1aTEzKjwwghLhgE3h+o3Dy4nZKo59CWyQ/Hp
 cYdyR1RkWb4MGj+aDEVTLHkT3eqSyqhspmrikKS/kyt7UDd8ySVj7Fr6LGXFrE2faC895Cuu9uC
 CRrD7QzDhV4QIGuvnKTiZFYqTRdGCoRXA1hmbp52Bos3j5PgXxoy4pc7e4LRg34/mzl9vAkHb7a
 fuQYJ8bMExO8p/Ozbssev8ck8c9AHbVDsVpSrMSq5NO30O8iFz8u46QZy5gJchZWt7wZHOnOEIB
 M+flVpsLUuFItTw1OI+YU7w/UjsMfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150171
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

On Mon, Dec 15, 2025 at 04:38:51PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> DPU version 13.0.0 introduces changes to the interrupt register
> layout. Update the driver to support these modifications for
> proper interrupt handling.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
