Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F3FB1424A
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 20:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB02610E58C;
	Mon, 28 Jul 2025 18:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcFmvrzc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2646410E57B
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 18:59:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlQZk031288
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=g3b9mjC0DOS1TwNiZSFPS5aw
 kCSouvEfEECI0Xi46LI=; b=pcFmvrzckhuIL++xLIxfre8lNoQD6k+Ws3MV2M6w
 btcd6Titg9W1w/jUeebgyZbMIgfwYKc71Bk4rnApD8XY5EW56PdJbompNCwbJD6i
 7EJJFtNSbNprjMuS4Q4D1+uFs7lTCMbC4XEfoyKTyeCdskXzGVBU7WRjYpoBY+Ja
 SN0Kvz3cnFujCiq09UUWfWtxoUcdQODiGRdSJW11M7f9iWeef1BK4lwP24g4mlzc
 555Cn72oYPTQ2krMRu6FUoksgZWFWkquoVIClMOc4IjftpJe/tQsP7a79kW4XV8p
 iBmXxnTXff2Xo2YnHgUMWfqh5RrVhqlwsmZAlYSdeqOSoQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xay9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 18:59:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70708748fbaso78583536d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 11:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753729149; x=1754333949;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g3b9mjC0DOS1TwNiZSFPS5awkCSouvEfEECI0Xi46LI=;
 b=BItZyHSisoCTqar0d3+BZOJRev+EBMdZoE8x+Sr2tZLKfUWLwuq3L2nyMcg5OTh3wt
 r/YfrPm4uCH4MDr1YvFvVhq2lvBQHJZ5dLZ3Yvj0PqVYWnYBnVcv/tUtw3fwu0P3lB6j
 zf+52iyIn9INhIyvLjuhyql/fBqPCwZkjZpaOp7hzBFyLHCy/It/Hyf+bl7LiYWYMyyb
 H8KjKP8eK4fXQFs1GY0Ty6hxRk/DT6SSdx8cVQbnGb4VCgvYGy1mjHO+uORpqLfYVVQn
 eizkyoCWsJGTamk8RLb6ehxkIGqp6ICyTA4EkhQ4SDzJp81+QNgZCP6bBX9p4ME80z21
 YajQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyjKwm4jOxI5tnMJLqStE9fpaDjdsP+lAC5Vn2Yu1XjdvXQj/xgsUlZQMocRTRI1t0N0BmNwtsxUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrGjLpK+8E0UNVlOA6nQ15DYYf/CilxokGouWz5MBm1FKXqE/M
 UizPH9uWD3bLBCnL/zLTXt37CjK9OR5/8/XrGzmkrYZKkjQ4p/1KAr+fnFzOGIzgU6VMEjq66vc
 nsh5WbgABCLq/1s58kKIe/RpGshrQBX/uoBeUafNpC5RUdhvRcH1u6KrpIkwMI/28sg//qBs=
X-Gm-Gg: ASbGncs+6vU9LIG1gJsMkjWdPyh6cRJajgfX88DCtFi2/TK3cfGBCJyY4szgcQ0Bdb8
 2HmFmnWETpLV5JMdBQ34bCfbR9ETw5RUlgJDK0IWtfz7zcGll1BOR1jMzp5m6iuuoEj5tbrlZaO
 5MHGqHiie0G4ULZfHJRmpu9kFkTJqdpZPvx8aPjrqLtEY1wgI2FhiRXXMLEsPauSHJvg1tYeBzu
 8JQzhnuSNi+yX8JTRMjNzHybSrNLe8GxWJ8AGKiQ2+5ziPb9zYyn2vo+n8joAjlMyyqyKGHvwfc
 So8cC41umv2yd90uwf4GRszZG5LWis9THSTFfK5nKumoNSs6hllQNoe3BCz2hLqf3LDylO9v7NW
 z56xRg8CmisizqJs+hZGfQwBU2QshRIbPBo8n3Pt5z2eV/z/iEKJZ
X-Received: by 2002:a05:6214:2261:b0:707:1b3c:4124 with SMTP id
 6a1803df08f44-70720514bc6mr139815976d6.6.1753729148805; 
 Mon, 28 Jul 2025 11:59:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeR/e5yy2Dmbqpj9B2szzZpphi7NqKMlFSMX2Qojm62xxZ84NsscDMGppFa+sWmqZGFGaQuQ==
X-Received: by 2002:a05:6214:2261:b0:707:1b3c:4124 with SMTP id
 6a1803df08f44-70720514bc6mr139815506d6.6.1753729148113; 
 Mon, 28 Jul 2025 11:59:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f4267695sm13324171fa.50.2025.07.28.11.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 11:59:07 -0700 (PDT)
Date: Mon, 28 Jul 2025 21:59:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for
 X1E8 and SA8775P
Message-ID: <kvnw3wkbn3jedfxryqdikef4db6ij4lobgj4qp4dgrpd3sliga@w6do67fiyhri>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
 <8399dc75-6363-4ae1-98cc-59b5b62dc8b5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8399dc75-6363-4ae1-98cc-59b5b62dc8b5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEzNSBTYWx0ZWRfXzXuk+MI9xu0d
 lG0jQr9LzeGKedaCiRIzA4SICNUyi5WvEuUZ7pqRnol/l/3RbwyJRrboN+p/mt086iqHj4EFueW
 EQJ7lzfWM5mOvJAKchbz6N/KKBx+XvRMjzgbo0vHYb4ofNoFObyVYu62l8TG7QANy25YawwJRTd
 8xA9IbJUOIToOLdy6CMgMBvBSBojjJ8SV/FgnXqd6n+u/9dNL2R+shejN5srWw2xx5FpNKsuH80
 maB3XypuT4y8EyKdWf7T3iGiv2w1Lam/O0GFK6G4I0im4iw+4Iw9Iy+uqcvn3ubFgHvz/jwDkMH
 w0FytrQIMQLPshZkObfIleyJmHnhNjntn3lrMzEQ2/aafqUsvvXGFfNZ2DhvoXUFAqRhY7T4Twi
 YBTLHgYPr8k6sDtr+UnCHxHketL7FBrPI7Ts6VuuTmUq7p3zTVOyXVAI2DfBLqHo3YMxbaC/
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6887c87e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_uIZQMxxb9QNBo7-lSMA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 58WIWUYNCUSv16ODEL3DnHSRhYicDInu
X-Proofpoint-GUID: 58WIWUYNCUSv16ODEL3DnHSRhYicDInu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=690 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280135
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

On Mon, Jul 28, 2025 at 11:29:31AM -0700, Jessica Zhang wrote:
> 
> 
> On 7/19/2025 2:14 AM, Dmitry Baryshkov wrote:
> > 
> > On Qualcomm SA8775P and X1E80100 the DP controller might be driving
> > either a DisplayPort or a eDP sink (depending on the PHY that is tied to
> > the controller). Reflect that in the schema.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > 
> > Jessica, your X1E8 patch also triggers warnings for several X1E8-based
> > laptops. Please include this patch into the series (either separately
> > or, better, by squashing into your first patch).
> 
> Hey Dmitry,
> 
> Thanks for providing this patch -- I'll squash this with patch 1 and add
> your signed-off-by w/note.

Perfect! Then it should be S-o-B and Co-developed-by. Thank you!


-- 
With best wishes
Dmitry
