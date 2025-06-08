Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADBCAD1544
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 00:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E290310E35D;
	Sun,  8 Jun 2025 22:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BujmzGng";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFDB10E35D
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jun 2025 22:36:04 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558MPGck029940
 for <freedreno@lists.freedesktop.org>; Sun, 8 Jun 2025 22:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5UMciADcDBohw7l3Afqy21k4
 B5zDCEQKS7YSGnXaHgg=; b=BujmzGngVGPBb8uj3Mj5Gt7f1sKcye6En4vb5nnW
 5LTynp70edvk8QYYqK0naItmgF6aDsUQETuMaFYFa6HTLQm/sdCJIzlKs+NPW7IB
 K0UHG5oWKcP7R9RP1CnAh3An7oPjEhMa175nhsu7LHLAbKnPcTM9BPBcZPZhTxSY
 nOUzr+s3+Z7f3KjJDqJV+S+3pmwtowJG7yCIdR+FpvqAqlgFtNdEWwpkHtsy1+rF
 9jH5DB/mCetSuSuZI6PA5otnNaSk+tCmlMYWBkENEmxblRqTyLZ7vmLlrlTlIBS/
 71O+fiYLKqBIDxoKq9PWu5IlJ+PrlIAwBTC+17hUinOUcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpktyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jun 2025 22:36:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c92425a8b1so608431485a.1
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jun 2025 15:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749422162; x=1750026962;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5UMciADcDBohw7l3Afqy21k4B5zDCEQKS7YSGnXaHgg=;
 b=jApFLpk634kHyZ7lnY2VUWmG9tnqObOuULq2u57Z37qps2n2QelXpFbueH88bN9J7U
 gKMNVD7BeMMr50JbwF+Siqf4HKt8oWTqZL22R5W7KilPF5iuQuatnTQ+fIUUowOVgodf
 YcrN5AOCV2L2A+wgpAVb51H893C7vEIdLumzwVcmhnXsA74iJSOpXwN3sBeYrPpAbE4+
 c8sWyAqoCT8D8484d/vOZ97tV+MQH/aFgFRaXcvQ7nvPuofWsT7thIp1g34wau+kNZTH
 UlijqSThrBYttQehCSVU/HTOWB5yyI4XoSz1tjVZH0J+O/MTf04DuyqZd5Llm2abaEtF
 RCWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiIYwrweY2IuwTrgdyXOOpRHywT6Nvz7/TnW9p79ZDh5SVTwZNotnQ53jjwrTuVo4gh33+dnIMhwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPhMn79jaKC8hHDaYwwcNGTk4RL++SL0wFQWxFpJztsDwzXthD
 fCNC5m2gCV/F4uX2ik3LeKAWDEBe+9WriDUuMB1jWnJADnENQiQRE/4j1CeqFnk3wWIIYf3erNq
 NCC51vAu7TQ6wXDChIaSMGllhftPtT1a1N6/lLkJTXALm6wOJYe8i87uLNU6OCJJ28P+H5Zk=
X-Gm-Gg: ASbGncvaZYWnUJquibAspXLjnPjyUaJ7+ERrMsjtxMoBN3lxvva1FPtIC7HD4BehC0W
 7cQosRNBFaaOCE3ZAu9BAyW/CvBlwlMKC6PqcxQYyg46KQggbswSaEAmmOIfyHzCVGiMxB28Tly
 2G+9XD/CXwv8Ma9KwQ6mMqEdDe9B8cHVgTav3YnlPjF+Ur5riiuNDtFZFwYbcaWj+5DJBbho++b
 Xbrzyw2Z7+nf/jqsHgfWFXJT7f8tXp308HSpYNT2nWh+2+OozYRoTaLASivuWw0Ngll5CImNFNV
 K6cmvdJcnYxTKCkzOBBbSNjOQq9ZfMa+hhGCsG21Akv3bLCCoEqmW30+j3TxhHgKnGMpLIWGJLp
 ZJjd6kPR3pw==
X-Received: by 2002:a05:620a:3912:b0:7d0:9a17:7b93 with SMTP id
 af79cd13be357-7d38726d9f7mr1026517985a.25.1749422162516; 
 Sun, 08 Jun 2025 15:36:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXlQeV3tbfCn8ZNJPWj35kb5AP7pQ1oBAPDaVCFROWwmvnWZ9k6Uz3+DKk6ZgzIutglpKe9w==
X-Received: by 2002:a05:620a:3912:b0:7d0:9a17:7b93 with SMTP id
 af79cd13be357-7d38726d9f7mr1026516185a.25.1749422162205; 
 Sun, 08 Jun 2025 15:36:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d0183sm899166e87.49.2025.06.08.15.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 15:36:00 -0700 (PDT)
Date: Mon, 9 Jun 2025 01:35:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <3tmpywm2ipqbdhbu6qga7eb64jk6lcqpqvatmkgwwd36qcqkip@7yazfvwlvwit>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68461053 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OnwjkJn3o8bp6UkAWykA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE4NCBTYWx0ZWRfX90wq2TC2Z62T
 VcagPIUUwowVj0gjGnScA4wKTPLKvyHwLFn0Qyjk3JA54Ha5OVsFR+vr/Y6fu2xEUXw5UDg/Fqu
 d5fph6F+R5zP9+oLL8xU8Ltt4izYDgoRpdZCof0EtoWYUhm5ER/ULr0Ia3JfFJp1EGXtMXdeMh8
 vaJcMYtFFznPqMEwf7tO11ZMszXlzpROTLFM6x6/qOLlEfhoMnGfPtoPmAUPgIJLKP96KUi7X8M
 mr6C+DeBDqpCBaUhYRlOejV/JCCcy726wJzygTxmgg/7ZdTBqRtA/UdtbFtHX48dzbQKRp5SSKN
 FL85hvFw+RZdPOfmdmiUB3PRmwOuZ4f8dUBlbJLVIQeiV4HZUqMBXqtsFgNUysP01i1w5em6ndY
 rcWssZYKnNDs5qygxTRx98RWfMQArEXZwxcn7BrvbFOXn/5M+0sJ7ivQbBfjk6egpuIE3/rz
X-Proofpoint-GUID: YFjanKJJIqj_PEBHaW0Zm0jcLtPC5s85
X-Proofpoint-ORIG-GUID: YFjanKJJIqj_PEBHaW0Zm0jcLtPC5s85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080184
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

On Wed, Feb 12, 2025 at 03:03:47PM -0800, James A. MacInnes wrote:
> Type-C DisplayPort inoperable due to incorrect porch settings.
> - Re-used wide_bus_en as flag to prevent porch shifting
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
