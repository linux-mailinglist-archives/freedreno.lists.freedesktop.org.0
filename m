Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D32B53FD2
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 03:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10AC10E3FD;
	Fri, 12 Sep 2025 01:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3TxWoP2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A46210E3FD
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 01:23:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BK5kUa015492
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 01:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=phbp1n99fIqtgMb8Vmy4j4H4
 6BAYfSIrlAEx8Qjq1Sk=; b=d3TxWoP2/LYVaA4Gx0sEwXAL/6dei5QGC1WRhyK7
 E//AnrvxWvAc+hQu5facbEQscD/S7ydLzj/Rk9Uh+fYDyI9jFBus/XEanDKY+Z/b
 E1LJhhr+497Y7asGnsVon0KnMM38vzia5xzqr9FfKbqbSfhB4WLIAZ2phAzrYpc7
 TPVGxbmdsGqWRCw9DftynMpaCrhenT0wUVWNsRT+J8y9gWyH79rigQSv8Lsh+FeB
 T5eCNjBspj43EO2dXA0AalhdF+J3l0GO+Lem+SkDp8yAjnTgU3AySS5k96gdtV5x
 NldL1vfUDh1ND6jl8QcfTkbZBKA3fBrc6xb7n9WzGdfFqA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m9msr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 01:23:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-81678866c0cso262321085a.2
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 18:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757640220; x=1758245020;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phbp1n99fIqtgMb8Vmy4j4H46BAYfSIrlAEx8Qjq1Sk=;
 b=uLqatkqdxAlUuTkI3Z0qgGzNw2AI7w7Grg9kNCbFQxBIh7aXQdyCHVwrN/FH7/4+xk
 m3/SSM8bM4haYzr7KxNNrdq0pDhA3mawqEu5OUwVbG+wRENJtZsCTHoC5GxBrAZNTyq6
 B7dqSt8qx+itWraTotQZeADadicqZizoqi4tmmhSRzc/BU8W1kQhLtjuMHoXd9N/x1si
 q6xcTzWwvsjMayFGxCo+GkRYWDotwoxJPZPSzgEz7cAV6x/fBishW0DUvK1EW5Fr/HSA
 /wjFfR9iYxnDViJWKy1A/3l8px/1iuV3Nh0+xWDKj8N77DhwP99wkMxzmVlcrmvGEmuA
 5dAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCViymp5et4H9aLt+iu8rw2sb4I3lngXjMGgt+O7tgaVhWXJXR/kwmHR4DKClS5yxlCsh6rGLGONToE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjDNGf3hwAS0paaq0GesElQu7Blbrvq1fD9kJa6Yt4pLlQQuP9
 qvezT7+An/dOPAQil0OpfxtAXw+85FaADqYI0sKoCOqEQEfPKeJaQdR23PUg+uU16nFU6TNwhMd
 45jzEV4N1JuHJmM+aGRvf9X9yvYxhOccm2fw80CObVddDAQ3r5Vo6b0Ss8HuAoQc/bRr8bSg=
X-Gm-Gg: ASbGncvL5otVt0CAuRtMVtSzoYGeUNcYB40c5DScvTPF/DS8EFwjKksII/Wbp9ovemc
 V1CXV9MkJwwuaw04iE1xPwgLju1YwFGi25VL8Wiyv1CSepu514S/pN91FY0Z7C5J1hgFYFtzwg+
 bBqFE5meYkl9KSiEYyXig5OLov6ni7S2Cbv6WhmzoKOuv2DmRYh40ACGzztWsp0rRuMN6MGig7h
 Jj684nTxOTlJdNff27ysBv/Fw8cT8AJ9G4DSleF5o3QugyU0EIAY5q1zzLTWAMw1PhdojpLgYhL
 sY4uRnXndC02kaPuSb56BOs8/dSnKyj85qxuyaXs8nX9gAzMA3NjHs8mFEO++3DLXagdVb0Jd/e
 /KmD2aEEFAco85V1u1eiZ1nD4cU7E4WKdz3lD1neN9T8hQZelixZ3
X-Received: by 2002:a05:622a:1249:b0:4b5:e72d:dbc5 with SMTP id
 d75a77b69052e-4b77d129e28mr16280201cf.48.1757640219985; 
 Thu, 11 Sep 2025 18:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAynI4bz/KxCp5t8jQU11GPgKeKhLD17wiB7Oe2sOXdsf6j6PRyZcg3pJ4ziMN/rj7L8iEeA==
X-Received: by 2002:a05:622a:1249:b0:4b5:e72d:dbc5 with SMTP id
 d75a77b69052e-4b77d129e28mr16279831cf.48.1757640219550; 
 Thu, 11 Sep 2025 18:23:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1a820665sm5335571fa.33.2025.09.11.18.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 18:23:37 -0700 (PDT)
Date: Fri, 12 Sep 2025 04:23:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 03/13] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
Message-ID: <msoxnqzbmyxztzr4e4a44gf34i4alvnkzbq2hxwcymc2k6qdd4@5cij6oq4k6qh>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-3-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-3-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX5O4xuJ8PxZfx
 rXkUiuRAkn6r689V+vnvyDt2ntrIWQRvOwBrPx2OSaW44+sSLhsxod5o+q55vKDnWhRg9fK+fF1
 5FA8NlsqQMV3PyUhEXBQa6GPoacyEG32K6DP2V3vlDo/kkaJ5oZ1KbCsfPmwZCOtuB6d0PaNYJ1
 CZxZ9jO80mCoPK+spEbIPlC6VLagToWdxRC59QqGmsHBscwGSGqLdUG7+6ZfrrjB6mK9swwD0uf
 8YCiTYZEXmh14eurUrXus4hQN1Nqxx/E+gIABQaS4VbhUHzjiWbFgtlbBovcvWnjsoUuprj0RxN
 NWbYaeGgJYvGuQxeKCAd0UB8T0YBX+wuMGlPA8y1MISiN69R+kjCA4xGaprZ+mbeh7wIx5+joDO
 h+PuCUi5
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c3761d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vMfMRHGFLa_JFT07zEoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: rR7EIj-Icsp0NQcxPWFra4KE7glPG2_v
X-Proofpoint-ORIG-GUID: rR7EIj-Icsp0NQcxPWFra4KE7glPG2_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_04,2025-09-11_02,2025-03-28_01
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

On Thu, Sep 11, 2025 at 10:55:00PM +0800, Xiangxu Yin wrote:
> Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
> including register offsets, init tables, and callback hooks. Also
> update qmp_usbc struct to track DP-related resources and state.
> This enables support for USB/DP switchable Type-C PHYs that operate
> in either mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 54 +++++++++++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
