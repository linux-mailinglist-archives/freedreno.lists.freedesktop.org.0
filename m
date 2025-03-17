Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4661BA6526C
	for <lists+freedreno@lfdr.de>; Mon, 17 Mar 2025 15:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A38110E183;
	Mon, 17 Mar 2025 14:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iu18zEvO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B9D10E40A
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 14:10:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H9xbEU018677
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 14:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1449/WYbuYcaYwnkoadiFehF
 7dXcVB4TA3yA3L94cbU=; b=iu18zEvOu1bcysiTo7+4gc+ahaoAAWo0Bi0YKy8H
 RVs83kjtNbmUim4RzPzGi6PUzyvAvH2HQuKTAD4FOBpbHlrIgbr+Q5bazIIG1ipx
 dQ4KIERWD38Wq0EsOmr+AeMr3o003f6fZbcclnA5pfdrGJsevfwFQYI/aubHw/8n
 sn/c5bljdZWQYkdXgU8LMM1sv6/FjPm8UU7K0UyWI6Sv4cEk03vWeX8viefCnp6e
 hejao6Ve+SWZr1gALc4PLS22MVIQM84ZgW+YxDA4VE39HpKFTBxBTAI9MJ++dTip
 24zdzSiD7b4rbuKLnUdyd0wYbbZIiQD5tYgtIoHB5fdltg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1r14yq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 14:10:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c3cbb51f03so819695385a.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 07:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742220618; x=1742825418;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1449/WYbuYcaYwnkoadiFehF7dXcVB4TA3yA3L94cbU=;
 b=Vvjzxw9alnvVM4ozIHXFYxffr7Bhf6pfopSBd0stJmzZ3m+5+fa6OhfN4Rs0REqCEm
 h2Q/UDNPvCDDK3QcuT9Xh/4ncCYBRRAYPz0HHZNb+2jQq6bxlAmGIMKCD2fcCxLRUr9g
 bfTUy94HJXHmQs0sRN2wmO1zrS1gXUBECd6P5LZ9xGEiehKYrtRYKjZr5LyOVzsm3FC+
 +3dHDFBiGshwLS/jiPz7U/fvGMrAMfjARNzUdW3nHuOnXRwCwf8ddgifKsr3GO3nwnCT
 mzeadfjZx6oA2lxf4wKeydMB2e5vKTtji1jLK7hMJVhT4/O0ZNs+npEMLvMkeP1NKsXp
 xqiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb6ghsl+yd5cIFOrMInppi/R439UCvR07+auk7ivlmu2NdtPecIhM1BygiLMQvkUz2OMJmSkSzNGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxscxEJyI3pX1EYJ3lQt1Ji2198uYW6OhZwWTbUQHCaV3YCac2b
 HsrmfmvzBCYpgOPSgcCXjPZKdLDxZVQDdjZP1XHUbcJMO8owxrTTL24HSAcaYimT2JRVNLleask
 Re6lSZHYUzwlxmZFUrErSscrEuKifvg3FxiAepFW/tVY2tPFH9JT/up6lVYYagXZq+U8=
X-Gm-Gg: ASbGncsBOO9Y2EkRCZWalsk7PKuvCJi6aKHTMSbdleI14Z5GJyUFKcA5J4ZYbSnOtBd
 QaSRjbCHhi24LEFTdegntkIbmfYKiy2H1gYrfki7B0qx3oi7C9bC/t79T2O714cUQJ0CaamDHkl
 AlxUbbNVaB1HE2vOhZTfvFmu+SxxbQcvsTB3cluvrw0k6W7aJ3KOIJWRRSgBlfz3mUGUSh1ydDw
 Sd31CF6WTDdf8T4OZnCxh4kWZIn6Sjvnx+APcFVN4Cp8hg16ajaOB79BLtbl2aFrriuzYQJy03w
 Tue5igdFN1XwHXZyOPW9nFE/Hhq7KQsxbXRNczPznKHyzCIK0rEWGpdxmU+ODqb3t8BR8LDKjEE
 h130=
X-Received: by 2002:a05:620a:4089:b0:7c5:6299:3da with SMTP id
 af79cd13be357-7c57c8fc7e7mr1286949385a.39.1742220618357; 
 Mon, 17 Mar 2025 07:10:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJFdSdzFzRlQMfyJs+MkA+3WBZa7mH06t7taxNZZWaQyeYqJOxUH7YxaZmqOhaAH+nbNuARg==
X-Received: by 2002:a05:620a:4089:b0:7c5:6299:3da with SMTP id
 af79cd13be357-7c57c8fc7e7mr1286945285a.39.1742220617964; 
 Mon, 17 Mar 2025 07:10:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba882788sm1338685e87.183.2025.03.17.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 07:10:17 -0700 (PDT)
Date: Mon, 17 Mar 2025 16:10:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 06/15] drm/msm: Test for imported buffers with
 drm_gem_is_imported()
Message-ID: <xvlixbldl5phzstzayjwuf4c34x7ji2xts62m7dmnhmdcokoqs@2os7zdjrq2ft>
References: <20250317131923.238374-1-tzimmermann@suse.de>
 <20250317131923.238374-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317131923.238374-7-tzimmermann@suse.de>
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=67d82d4b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=RpfBGSZpqGWm18XDRZsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Fbus6UHqirh-EehcgUpjnSGl6GwuA_-t
X-Proofpoint-ORIG-GUID: Fbus6UHqirh-EehcgUpjnSGl6GwuA_-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_05,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxlogscore=684
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170103
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

On Mon, Mar 17, 2025 at 02:06:44PM +0100, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/msm_drv.c       | 2 +-
>  drivers/gpu/drm/msm/msm_gem.c       | 4 ++--
>  drivers/gpu/drm/msm/msm_gem.h       | 2 +-
>  drivers/gpu/drm/msm/msm_gem_prime.c | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
