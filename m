Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0ADB492F4
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 17:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336F010E54D;
	Mon,  8 Sep 2025 15:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1IkmVTD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E754810E54D
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 15:21:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889ILfQ010653
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 15:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 f6Pkzb5kg5j3jhry+0rAbxrUj/psaHYMGrHrVc/RvVE=; b=b1IkmVTDioXYCvCt
 NGOY6mesOdodrYENwnVsGxDKbMOM8N1ZDWhZnwe7KEg2T09hiYFosNFK5sNCFFID
 QQsFpfmAWTm6CK9AhopTyak4RxBI2DEFtAdDzMXr0+sMOXtDcR3JMPnnDZ2F2LXt
 ac1m6HXUzAcNiBDCbITYeeeXTnupsdBwNUQAmhSEg5qNrSLOu7oQ/jbGT47U/rBw
 ObinWYLympLe1DMcq5yZ+CigfODqgc5DUqFqVess2ieX/geqg4qvfo8mqfjuP+m5
 7Lc/CyFhxqwY+1m4ts23U2E7AbTgyZLvmydMPcHxmNFLFaX6e1tlNFyVpA3I8xzh
 YQaHTQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kvw0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 15:21:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b612061144so2577811cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757344872; x=1757949672;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f6Pkzb5kg5j3jhry+0rAbxrUj/psaHYMGrHrVc/RvVE=;
 b=heIkr+1VUJiJZckkwjEETvLFAR/XYtV+CxKqDyQJ4k9zcdJtXqYWk6xSV/fz0bjyhx
 c7k1xxt/+xNNI0cXyGpYqAOAajZerXjqtGSskXZCTEtKjS5aj334QKhReRInlKUJItS4
 P+gStEGkNduWHlIwlmPfnXvzz80Z5cNuIhQ72i+vvd71u0VVnULjK+AqRmPEu+RVVHPI
 n2fEU5TOeDKcsFr0vDyek7FpDbhIpkpx019SVpCSIniFrHU53rzFdfzULEjF0QVHAYQD
 PMiq64l2mIMmiobb/X1K6qjXVxg70+7Ll1MTHtUv/yIB+nUCvpk/h6Hdv93mlQ6oE22S
 lN4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVUtcJiVAyvAOTVewpIBcm9yXh02YBuR4L4AozCxoPQBPGL7qAGWtEYuXcvawKYA+lvc5aYo8jzvI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/BahGEM4hvoq7E6jDzedTLRj+L0XCrFKI5zmS5Gw2oFJ2QTUS
 Icvz7WiFDIyGx2Qq3I0JjiUj3reQlOxPTp0U2dEjFlPiJi4mYv7YY+dMLo9HgNKzCtTFSedvsZz
 BdSzk4opfudXipDpfh9ARFEcL6oEve04J4JUJrk14tKAaqt7dWE7PqcEZN0oDobEy8FMFOnc=
X-Gm-Gg: ASbGncs4Ldm+SmYdVHsRsQaC+TAEBiG+tcev0htO8nET1tYzPqyhh2Ze0GfFm7LcsLt
 7xLwetjcA0QvnepWfP+4lGCxGjIqhLb1K+WtBlOKclSlJVLOW7A27zd8y4dkr2w/DCYFu7YxmgE
 QcgBnNywVrhfw+s3QqIAJE8U/nJqz4BXtZQj6OlevQS3S4K0CS/v27hXHvu2ibor66eC93W8xkM
 OtOpAWPIPTUyj6Ymj/c4umZ+rcbwcFibbPSvjt4nGfA5UMUK4uvoAvYOBVGxnqiEA+bXjSh2TnA
 OjRS78jZ8AC5dyr066VVP0L0blUGmrcz36lKd00Vxl68L/re95ADX/wDAZTlRI4DrljvvU8lO+K
 nzxm6NmeWCHREsIeh+U/srw==
X-Received: by 2002:ac8:5787:0:b0:4b4:9d39:3432 with SMTP id
 d75a77b69052e-4b5f85322c4mr61314721cf.10.1757344872072; 
 Mon, 08 Sep 2025 08:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsQXC64Y9u+F8HSfWVUBHFUIev7jGr7kCnI+D3oKSm/zJ4ylRrmHPoXwe05OfIypUYK6l3lA==
X-Received: by 2002:ac8:5787:0:b0:4b4:9d39:3432 with SMTP id
 d75a77b69052e-4b5f85322c4mr61314421cf.10.1757344871484; 
 Mon, 08 Sep 2025 08:21:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0409bf055esm2249764966b.85.2025.09.08.08.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 08:21:11 -0700 (PDT)
Message-ID: <f034dd83-0f50-4632-94a4-ff68400dd922@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-5-631b1080bf91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-5-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX+gyF8ltW+Rwo
 BewnW1ZFgG1J9pOt7JfiO350NRnZPGoBQt76K+WceDjWPQq9oQGmBVHphSC3y/sY4UkZIggU0g7
 19ey4MLCqEJoN2lNT+ZLUHYDMYX75ZPHQItjwgBACOHO+E+nMNECbmK6FpgdM0WmokYt2TxTAj3
 d419cAh7bUEjDxWvuVtgDEG6JmJB2X5PMTj7/2xGhHThfViVE+kHwIy067lkm3QXShYED5IQSm9
 ZzHJv+UxzepGAdy2SODMZGGXhPI7w24Z7zzqJphWAwLC0AvTuwL6oG3qpV9vVqegI4FZOKE7gBs
 qEdUepVChhSRrNaEdH+R2jxgveNsqpHADivj7g+cgEcI/wCEjROkIspHDHJtvIFVx1jMQ4wgBRY
 LbHbGpzm
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bef469 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vomQ-D7Nz7_NnwrRMiMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: BvLh1GIsExuaUCmPhjSF-FFw8BYANDUo
X-Proofpoint-ORIG-GUID: BvLh1GIsExuaUCmPhjSF-FFw8BYANDUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On 9/8/25 10:26 AM, Akhil P Oommen wrote:
> A minor refactor to combine the subroutines for legacy a6xx GMUs under
> a single check. This helps to avoid an unnecessary check and return
> early from the subroutine for majority of a6xx gpus.
> 
> Also, document an intermediate unknown low power state which is not
> exposed by the GMU firmware.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
