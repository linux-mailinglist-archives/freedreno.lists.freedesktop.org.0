Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FC4C5D919
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 15:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625A110EA84;
	Fri, 14 Nov 2025 14:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqL1QxTF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8eXyFXq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF9510EA95
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8ROo61430755
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QUtZTR/LX8xkNad3zOXNntb+ZjNzmULI6QNHH4u1910=; b=OqL1QxTFd7Rl8e/v
 ayPe7X835uwAcXp2YY1fUtP6/80nOY/RlY5caWAgKFOAjhtAMtT3UWJaPiNmiDE3
 ND8AdAvjes3opZknWLkwM/U1BmZ1lMOfp57q7osKudbRYg4vgF9FjzS1jM/tWiK+
 wYqC3vMZcTzfT819kODmY2WjR4tSz87R5KIiFZm5xHTFifkGAmdbn5OSjm3NyUJ8
 ejz4AcbdQlcEVxlre/zDX3u/3OFjnrMO9OuLzhnUTCJpdCa83nSxs1XlZVx8qUB3
 yCugXlzowM6Uvvu0tKYAxgDVL/MwX7+R2jJ3fuD7XLrQ3sZQApmsxdi76hXQ+JKp
 AamNvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g2dja-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e8916e8d4aso81432641cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130406; x=1763735206;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QUtZTR/LX8xkNad3zOXNntb+ZjNzmULI6QNHH4u1910=;
 b=H8eXyFXqaAMWJIC3zuZsauBawkkKh0x2f6PoxqTh2lo2iCSh+YMknTnmB3PjwHDBwG
 nWvJyj/kjaCiERswA346xhF+6IQiKB4vk2uBXlEC+D7jh91lbI3ZqLVJfQ9KS7SI3p81
 qxhb08LfO8dtZQRl8V/oXhkrv0IwH+CLse/ZdUQvSHI+D+aUE6HtVb2WSd/wyERkR8yG
 mH7Ci9/Q53MFxVl4W05vE4+lVKNdctAPMYbaIljh/AYWO4ilC40ZEUqHyEpoHPrWGGXo
 z/6sChIQfyfRTNAHwHYE8GWFNCoUBNNrUWpiqgMAlO98bwDqXB+xaDb8wh3+IZFaTVrY
 L6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130406; x=1763735206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QUtZTR/LX8xkNad3zOXNntb+ZjNzmULI6QNHH4u1910=;
 b=PCk/5dxyzaNi5839gMuCFpwyRm3e4Y9CXnhX0cd+v/9BELRIRFC+5mf1wgMSgMIxzp
 TbuAFcFirOmreWiaWDsgIaxfO4r/dvvBxzBrYQvrkspaJCH88vF2he3NvY1ogJ7Qug1r
 QJej8u4ToUkqO4zX/xOpfbyH+zlR1WmBJV8fpClmL89cGOAYdlU3L5UUCmkA0mhSc86d
 mZu+i6cYYcVLgTazVcWOHB+vOlEy5FIRfYwDHwY34v7LUUQns9Cb6mCn5o40NCKdSB/M
 WBRGxFoYSx8b50c7ySSMwCZiZiTFCMyDIZgVYiB15ARha+fo6fGw5+r5ifSumU0FZhZ9
 kK3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1Qg2MJckdykLtUg8xHF/qXPgPGm+t4CsN+wet7sgz/Ij9f+puV2fkZjaPadm6wVulJ/ahW7CIm8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3ySI7m7amNxW6W9QbkbOqzJLMgeH2pLwmUTJF2vpO7BenyDDq
 XPd8GPVWlK0BHrfEuXMuJlOFohBfmDBWgtsgl25KJyc6PRdU1vHiTVO1OVuLl/IRjppE/f/tuQP
 j0s5r9mFvw/4jx5t+GdD44LihWxud1jA006e7rJFGp3bA5nFGXVRiKZ37Xl6HuwxFc2W8cCo=
X-Gm-Gg: ASbGnctEcUWLEzngIo3Be/KdhRL4BqbAZ7+2k0DPh734XPcQ0Ld8EgdV7plzi7VyDTo
 T4OMa9ox1D8UNdypR6LAQPbkWdZzMeyuP4P5pQrW9cUcorBT4ErD7ppyDUqIxxyvOfCARQzoesm
 oBAsnnjoOe7Jl/f0DkRqPTp0FjmprrPx7f+FuehhFAbLX3KGDyBP1dU1il9Ag7kN5Rz6UJzdfWp
 0Uj45qX8rnIZPMgXjC//+obKu714G97kcU2EvlapYMkOC8Qh/TuZH78R9qVgepYNw0eHE+pNGj0
 5K+azDsY3fa7+GAmehEqGk4H/8a69Vbwoe+ICVOaZFqYfoiPV4gIyCq2FuOKqX6Zux9S4l1o6uz
 +EUCO9Hel6FF1gtFUeSquzg/CRl79NqtC7cEmwemkJeqF1FABlXfJmW++52iYQrdD2brvEceXLM
 X/zsoKwn7ETyYx
X-Received: by 2002:a05:622a:58c:b0:4e8:a332:ba93 with SMTP id
 d75a77b69052e-4edf2142ac7mr47937101cf.76.1763130406239; 
 Fri, 14 Nov 2025 06:26:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7ZNsO/1TvO1h0/niYYuelt3zWYP6cQK//e3LNf7oVm47FCgH3fT1GElj2eHRDmKTUxYXD0w==
X-Received: by 2002:a05:622a:58c:b0:4e8:a332:ba93 with SMTP id
 d75a77b69052e-4edf2142ac7mr47936021cf.76.1763130404998; 
 Fri, 14 Nov 2025 06:26:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v7 00/14] Add DisplayPort support for QCS615 platform
Date: Fri, 14 Nov 2025 16:26:35 +0200
Message-ID: <176312947282.1737000.4785941412056554129.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69173c27 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=BS4b-AKSgWLh6_M-HIAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX4Pcc63UfkkaM
 c52r4Oazgv556lQeqLgBjANQgOe+FebpTxgoliNf0bfspozz0ltJ3k+O0jpRBpjxhbVIkPG48QP
 NZ5UCiF6dUwdVhDTNL28VoQr436Re97jmlJhxPargGeL0trkcNcnbm7CR2ITyyhOE7aHAB2tpMB
 C2LIuhJuwK+aV1ADkvggzZLSSIwmjq2KiQaF5PGjJSr081SkOhEQ8hqcBR571q8t5l6ahR1Vmon
 FWMeIxG8C/Zrcn1y+EdFs0Cyc1yxUHaAsd9SNd07ttcjVvxrVtP/dAxddKzqQAiOZuwS7MUwpCz
 052HOcMdkd5SvW5KVbb9J+LNqHouKSN12nYeZNseYV7KEylGIF0jrbyXUwb28MuDymhj8VZ5U38
 3w2sEuqd6tw8BiZsyTAsAQR15GU/ng==
X-Proofpoint-ORIG-GUID: msUj_ucwDJb9nEVaOq0CjVER1aurjHqd
X-Proofpoint-GUID: msUj_ucwDJb9nEVaOq0CjVER1aurjHqd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116
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

On Fri, 26 Sep 2025 15:25:36 +0800, Xiangxu Yin wrote:
> This series aims to extend the USB-C PHY to support DP mode and enable
> DisplayPort on the Qualcomm QCS615 platform.
> 
> The devicetree modification for DisplayPort on QCS615 will be provided
> in a future patch.
> 
> 
> [...]

Applied to msm-next, thanks!

[13/14] drm/msm/dp: move link-specific parsing from dp_panel to dp_link
        https://gitlab.freedesktop.org/lumag/msm/-/commit/866aad5cfb55
[14/14] drm/msm/dp: Add support for lane mapping configuration
        https://gitlab.freedesktop.org/lumag/msm/-/commit/36d978701203

Best regards,
-- 
With best wishes
Dmitry


