Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B61B8AA8E
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 18:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED24310E24D;
	Fri, 19 Sep 2025 16:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzejlcw+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0D110E24D
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 16:57:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JFh6dl029750
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 16:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2SMDH20YTKikXCE41BaWkB66
 TeohJUYWgem0sV6RAUA=; b=lzejlcw+i1oBedZfaNudsMlavk3kgScMIid84gJe
 pW9ux9XX/6CJYWa/LZgO89bvsDFUDjY6X/zCuvr/wbSvFpz1jdcSrXoVLklOmTyu
 +nKbzo2RQ/JzD78ltijCipZSZEPetdnBGRGBWGDcIbSTd0kWdPJ/vbNUwpRZUE7J
 V2V+o57ltvjq0m6g1RYMnnVivLzSljWY12aW4lDtd3JMkZ1xuhQxZaYOqg/KeIO1
 GnWJw/NrV42nrWBcRA5wHTydBSca0OMox5kU/0096QiaI9+ncNl82tQA22s7lWfZ
 UWmqNzEUx0axd44nKN2Hb8L2OZdALFJ914tp8V+mj+KO9g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy13569-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 16:57:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b5e5f80723so41618711cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 09:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758301043; x=1758905843;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2SMDH20YTKikXCE41BaWkB66TeohJUYWgem0sV6RAUA=;
 b=jyPRuWEKpjgME199eb+WfBdtue00TKc522NRI867MO3FAB+1qJowBblWyC16uzbLK0
 ninM58k4NZ/LFwSJswXS0/zA6CrcmmdcIFWrfN3QUi8mT9y521Wedt6VOHo7ZwfUVr7l
 7RFwH/3zL3IsPlpH2l43o8jRMFJ6Yw2D8xXeBfCNX/5Wbtl2ZbQFFdt6dipcPsQUkAxE
 VBobHlIjvdElf3xu9RKBN6R+TtmBWZce4dedOxrqheRcThj662Rz+XhYtaR5LBCv0899
 zYUpKxig0WCDiC74ACVbcwVgk/zpjREXwGCA+q+NAjwi6t8xnZP/BNkdN7F+Y6NVOFPe
 LKpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXMegjPqnOk8IZYC/9WNhVwkkpeZxrBORg0iH7xlszYyWacseN8PeXWMH/wmxQV/DX3WAKJ+1qVkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxnc6+1oqw5cRAV0UDzbrDcU5k1w10XqdAPFl3GZfeYIR96oMJX
 kuay1KKSZxlcZYnI/iL/eTIAjiojzBJUeCK7vzt4TB41CeLiXPX/PrO4whxA71NF99UWugPmeHz
 0B2cP3//i0ESwQMyQ36auwhxecpLdXcU3UTLx3T7S4nQZo8u4evld2banD16J2iuQWrXmBVQ=
X-Gm-Gg: ASbGncuimy+S2EkFBARa3MqkwG7GMXM7bkCbhc2ftiys6JMEbeElKR+am644mEbBweN
 fwcu7nRMMY1UPdGDbeO5Tl3uCigSnX0sGiW6bMfT0EjNd+7Mm3PuqVyb2kBJptD/ii4yts1qaAH
 5BHCVYyNGmaqdgWXiRPg3FGqy8eNEqZ41T5wdo0gwYQmAskyLiD8H5Ijapxcg7Olz7q8g+6C0cL
 SX2e2cEhWK2zT4TDbOiMObvzewxuGN3pUaLUaaxIQ+a5E3K774AzyQDE/+vCtOfCuQkfg0HIQFf
 dJVxNAouGotdVHsecbP9eN/ZS2EFyvkxvop5M8NGbxsc2I0ToG7kL6SmKKJaul+ZgnY483amwgc
 QrHowRY8Kj2LEpQeJqGv0bC736J4I93ZviYl7VEC4EFGF2OggaYTz
X-Received: by 2002:a05:622a:550b:b0:4b7:a887:9e68 with SMTP id
 d75a77b69052e-4c06fc182a2mr52471581cf.4.1758301043040; 
 Fri, 19 Sep 2025 09:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Y/hhgM/FH1MUqyFEYlRSM4m13q51NUGUOwCJl1YfmyFvHD8/eWgbghS7pUxj3fFOk2haZw==
X-Received: by 2002:a05:622a:550b:b0:4b7:a887:9e68 with SMTP id
 d75a77b69052e-4c06fc182a2mr52470981cf.4.1758301042221; 
 Fri, 19 Sep 2025 09:57:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36371919865sm9009371fa.62.2025.09.19.09.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 09:57:20 -0700 (PDT)
Date: Fri, 19 Sep 2025 19:57:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 10/10] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <46syobyexy3ya3jjemmxc5g4tfkup62cks7gg7qpbnrga4fdhw@4ramayspl5uw>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org>
X-Proofpoint-ORIG-GUID: MvkrmrfRCE9KLi5N77iUCCIB2jvMiaIY
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cd8b74 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=CHF6AoUvwY4jIHrWGZsA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MvkrmrfRCE9KLi5N77iUCCIB2jvMiaIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9hSTyEZBH39C
 96cwPSC72eMBgygqwIYQY7VJrTe4qwbxE+KYBmbT5FdCOpAOJmnHfe+fHz1oKbkuldrii+Z28VD
 5kYcv7ihRaOd22D8vcj767nCMiil66trhnhR7gel5hfyN0Q3JxI47g1fXuCxlnkUCub8pWqN6NE
 kJ+E5qqAul3mnxQnU16gRAqKF0xK+sP31A6v8Re8tDQmi77G2WS5owRyCfI4uFOCjMX8D1cWAwP
 hUtiiSWaWTOtNaebLkARjCPjbnphhCQOnG372SGQVVGuMJjWRmBc9phHRylJMSZ+vzyqxpD1X9U
 v5eblizVLgqCwZMXngbKJaZiRSUBI+uHDRhCpgiqqhvyJ9JV1GGIA7lupzlEozSYLQWYy6n6Gsu
 yVCFpyrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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

On Thu, Sep 18, 2025 at 09:29:02PM +0800, Jun Nie wrote:
> To support high-resolution cases that exceed the width limitation of
> a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
> additional pipes are necessary to enable parallel data processing
> within the SSPP width constraints and MDP clock rate.
> 
> Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
> and dual interfaces are enabled. More use cases can be incorporated
> later if quad-pipe capabilities are required.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 +++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 35 insertions(+), 32 deletions(-)
> 
Please fix the LKP report.

-- 
With best wishes
Dmitry
