Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5637CB20576
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DD010E436;
	Mon, 11 Aug 2025 10:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa1OArYr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8122210E432
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dLKA005444
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=fa1OArYrsMY1cNmv
 6U5JEBininEQETN0UrxidHl7XVnaDk1pndGlmoG23MCFUxED68xnDTNCSFHJIoSU
 ZIPwylxia739ZMNH8Q+CRQUzLNK+jVU9M9ux6Cvxy034AnLh7yPwJRzmMV4k+kT0
 1tqtXQl0X1XLW9KSZtgGRL0FmUFs9kNo2eMOVUzEzhQaVnNaOf+txkpqqpVJFLUE
 QDIsKSTgiY4a4JwpzbQisDLiDH3mLyYaeATtMFd8khcUsIKrsCZ42+Z6enisuDJY
 etaHEHFzHMotOcB+HuB7UIY0rf8xmx+IGGobpkQA5wxETZ5MyMyGRf08VgmHOPhk
 ZJXPMQ==
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx287k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:41 +0000 (GMT)
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-e9055838071so603140276.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908421; x=1755513221;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=XM+xr1Vo2GgjNxhvdhfMsLmOWbAmNx/1mF3FjIB7ekLaNd0xcbziaq+1nLmU8Yx2Jo
 uHwPgjkXtGtXS7WQNeSUGnHyg9gsHqj3if9hdWOkSmiX3oqhmL6JVEL+X6NA5nqkduke
 H1m49qpeZ1YRCZhsAoX/wDoaRcaQJqhcsmFmArh20LZ6BKHL7ZAUfDhtrTLE679xy4fU
 DkNc6JZ74Hkc7gH4wrFqmNUBdCnVrNkCJUMQKWWAaewv15sEJ0VwklRQj+HzMIsc8rQy
 y64E2riocc8dhf2CEUOBOX88v1svPnwL6hEGHWjnhCqMrYYJlCsdmmi2/O3SQsB6lUbN
 dFOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkBHR/SZb9s8gFeWFrN8R/so0UXTBRSz2swdZhIxvAaFW9uU8/n+nWefi0zGmTHI0S6kMEawJHZxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyknrluqDth+ehN8Zap8gHpY+BYRfSg9p83jC25F8OpcWFj/aa2
 1sCZtWefpjzCvlFy4FXJ78zVcXK4dAAKpgmt1T7+vT0MQc3HMn3IXVDSXxxy2BBz6i0dI/mGZva
 pekrUyjgEUBFxqBcwjLckShQRJGiY9iVJjic/Ws7oSruNnqcoPqJuGSRbGLCeNVqGG8ayoXY=
X-Gm-Gg: ASbGncuh2sORKXg2lWWdSvDlrkrzZUKeLNLt7kvDyv02YQgfkqXo8qO/9Hx8xlC+Gj/
 4AfyrqlcYrPsdEDL8x+emqdVH33XkCA+ElnyX1xqSKfU1pTedShQK+S6zy6juEO0ledI4ZQq8eC
 sUZiGBQXcQgG/7QRFE7YJ4tTDjMX2ZjMZpuZzbVrs801H0O5x1lz3dXhqKTxqewXaGvPtdiJc4p
 +NDG79sIzyZYZuL/tT/Cauhu4PZ6caumBekvfbV1tmp1ReMKj9aMhJFMDgYiMkxUPRDSKL7ElBy
 tnPBOMmHRdbpaN0HuODooaQnAs09gThubX5zFp0s3GjjHkZYv1RzODVYjv5Mf6DPj5KNQgSxyZZ
 VGoB6YdbDkjXV7Y/C6A==
X-Received: by 2002:a05:6902:1105:b0:e90:569e:8a1d with SMTP id
 3f1490d57ef6-e905c530befmr4533783276.0.1754908420459; 
 Mon, 11 Aug 2025 03:33:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEntP1C0STH3bZ4zJOHqYgn5Z4wBvYvhRLLkeSBhIq4vihJkw/i+kzn7lwfCsqCq1ZHC74r2w==
X-Received: by 2002:a05:6902:1105:b0:e90:569e:8a1d with SMTP id
 3f1490d57ef6-e905c530befmr4533757276.0.1754908419897; 
 Mon, 11 Aug 2025 03:33:39 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:33:39 -0700 (PDT)
Message-ID: <238a18e4-43b2-438d-9ca4-886806b77002@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/msm/hdmi_phy_8998: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX/v0bJ8xCNRA7
 Hd6dcY0nnASvp3Yk8WeXUUU2svTshINEFY1/xNs01wj24o7RRRzcJ30QivOSidD52Yzpfoqdll9
 br6naPIQ26gEcIr6cG1B0PUhHVsaNEWhqCQoGtg6RVrCe6GL3P9tUkDiktt8vz1SxWsHsx/vP2t
 rKf5wQduKrWLKuneRYqNj8EOYuo4orojut145H7grDpivDkXAtVG2D2hpDZfu0nMXIMbGlUYpnk
 501quMTdFbncp/zaJYia8bV5A2uuea404FhnMU/N+4pEkRqis9kqM/b5haQ+mM72t0YLj2UBo/D
 2b6BpZh6BJe0kD4RndlFnJYMVuguI3zMLqwghDSVSxFtu0dshdvA/qbLCQ23VrnauM1dqTz0hoW
 nVHQCJt0
X-Proofpoint-GUID: UIW0pEuFrTDEPHeUr_FhrAyQSAqihg5m
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=6899c705 cx=c_pps
 a=5rZgxjGdQ1phXw1xqkF1vg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=FvMT9AR2qkiEEVpopuB7:22
X-Proofpoint-ORIG-GUID: UIW0pEuFrTDEPHeUr_FhrAyQSAqihg5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
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

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
