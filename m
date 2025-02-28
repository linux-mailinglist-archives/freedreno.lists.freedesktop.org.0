Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEA9A49AC9
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 14:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E2310E2AB;
	Fri, 28 Feb 2025 13:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuawQ7rN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D8810E2AB
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:13 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXKD2018898
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jUsBvFfhxrhyKEITeHg16SL90hIVl1i/tkcjRyAbRMk=; b=MuawQ7rN7uMY4trK
 9U0OV8+fLM7b3FJmBkcbWeksm90hjlaAt5uaKzIoNOW4ODG87JtUjOFXdrOrgQov
 jcFg0a0ag3EzpFSrFWw/XupXTOP+TG4u5eyKxcZkbCi/I28ej+sX2pt3cvHwOxc2
 Q9v1FGWvwapWWfx9d7I7tyPG+9dctZGWfoAziqDvsoYw+VWgqJMYfj0bYivCuDwk
 T5iivyqltIL8reAKTkomLwzNxoT1kLOXWed6X+CVGOXprgPcVusFRO6IxiTJjKYM
 RbexFxPM1yy7sLvR1J+OL6fQVpLbDzcypH93SDCJOmwqePLaNSzmoZFJyXUrEvAv
 j9M+HQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn9f8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e1b2251f36so3862016d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 05:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740750192; x=1741354992;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jUsBvFfhxrhyKEITeHg16SL90hIVl1i/tkcjRyAbRMk=;
 b=EjxIQdwJLeKfFLGFjmUOQeuBOulHbFZyTElzAL2qlAI81M0veUXLQa+Q7hX/MM0ugV
 3taGCx7vQlkgmlMOe3H8F+pGHPXUfkuAMbE2yJDz+LKYHgJmcOONIMNvJ4XnrRShDKel
 XlvVja9B29PFzr6MeWrbzkmbMMek6/vPk5RLDMHzqWgniE8xDIp0/kCAG3hCo+Id9WJ8
 VP1wc0Wz7R8o1Xxi4n1GQrwGgzfOvZbSqoTQiH+fAjHzsRtk0cfZE1NiP7XwOqzuYmPe
 F+YAuNokLLHAZzaSzL0lauRp4JMhcxoU5dIVoOktKjwvBFFlEjcZhFRSp1N/wRd23pLx
 EtDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+G26QIMB4YwuSV/QAkahahTMoCUP5BZC4Iyr1b+eD06p2x9uzr3WGfLQJ6d0g28GqQWUXZjD0Xwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6EEjWpje5DM24RCfbMnOSAlkhfql2aZfI6pVI9iI1bXE08dkb
 xPbL2egg+IDaBwuPLviiKykG9VXSGv1FHotZpPQs3b8JRO8hcz2yNvTQzGL5HfmUMBTDv74gQWe
 nsJgG42bnJKoWyb37rK0EhG3qj25nUs3CnaqM+GZnEKRO5m+W8YUUGdLzLwM8y53oT8E=
X-Gm-Gg: ASbGncuQXC8KFRzvfu4hdiR51vWUMPjdhUoX9baTDzmnAlait99jLOpkDb0No6STNJf
 cw5WlLqaAgw+SGNEu6X9I3V/CFpsCXD+alUNlvgeNBo8tfUB+7UHTGHx7xrZRlHHpaZv+lKuEri
 2NGIJrVtW2v/uUMSULjmNARG0xRkUEZF65yFdQfyaofLPJYTZNoIk5qZsGzmk1FnaJJvJebjYhg
 s3qPxxBymjG9lvTthWtw9UjFoY/OGkY7FMajaYS2ykTtjH/voYhDYn44MxRTKzwszWPZJz1Qcww
 jaCRpAcHjdSb6gp/myYEeFkKohe48gRVedfvnLSkguZh88icG8CMiS2hfhCLZs1zURvI8w==
X-Received: by 2002:a05:6214:2b0b:b0:6e4:3910:ecf0 with SMTP id
 6a1803df08f44-6e8a0d82de6mr16983696d6.8.1740750191813; 
 Fri, 28 Feb 2025 05:43:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2eA/mVAmzoZ00yrwl3fYZmJW1K5Im2B6KfwGP2t2rb3Y2cUvSzpqF4mUz+BIR54vSE5s4Uw==
X-Received: by 2002:a05:6214:2b0b:b0:6e4:3910:ecf0 with SMTP id
 6a1803df08f44-6e8a0d82de6mr16983486d6.8.1740750191306; 
 Fri, 28 Feb 2025 05:43:11 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0db671sm291962566b.72.2025.02.28.05.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 05:43:10 -0800 (PST)
Message-ID: <50cf6659-ae08-45a7-869a-2300f4d037da@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8937
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-1-b05d22fbc2b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-dpu-fix-catalog-v1-1-b05d22fbc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1K-oCQk_cr_gh_KBIuVw055ALeKQHKJ0
X-Proofpoint-GUID: 1K-oCQk_cr_gh_KBIuVw055ALeKQHKJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=997
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280100
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

On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask and, as it is the only remaining bit,
> drop the .features assignment completely.
> 
> Fixes: c079680bb0fa ("drm/msm/dpu: Add support for MSM8937")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

With the commit message fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
