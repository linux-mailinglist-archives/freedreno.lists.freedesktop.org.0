Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA8ABBDA27
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 12:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53A610E08A;
	Mon,  6 Oct 2025 10:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvzBBO7T";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A0710E08A
 for <freedreno@lists.freedesktop.org>; Mon,  6 Oct 2025 10:12:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961DHhX014386
 for <freedreno@lists.freedesktop.org>; Mon, 6 Oct 2025 10:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9DjbUCmcg5sdBYa+VdHMlxmG
 F69VZ4TGKs8z0vOln+c=; b=LvzBBO7Tq6twkF4N9J/m+/YuUV4rwSzLlYC/Ifla
 9RZ4gWdS6Kg+7bQar5P2YZmvUZgOzJE82hLZi0lVm5i6oM76F2LamB+hvpcgazMp
 E5GA1m/kZEVrdKXlQC1naEH7QLGgNCvvmfkMthYsMh9wVmdm5IKB0KMuqCq44HcM
 FJctnQqcBCbrgCTjD77fd5C3SctiSipcXD2jly3UBsea0OpYS/0RAkJ0TqgVDk/9
 iYEY/eZFWZfXtOiTp1de9j7E/TOtlc53XbdadMLJ6S8iP8VlLfIiYrpDKeD3zduT
 ZbXovSucBY2cWrjowhyY5g96rXsgFSJyVwlmJSSj9Ra4rQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn3sfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 10:12:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e1015c48c8so107862871cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 03:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759745556; x=1760350356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9DjbUCmcg5sdBYa+VdHMlxmGF69VZ4TGKs8z0vOln+c=;
 b=vicZQy7AkhgOXg9K52oVEU4b+wAZuqpj7yy7zpF4tz71mrAn/S2GTsnIaYc97WYH+7
 TyZbEP9Musg7B33gR42VPWO9tyFD5mgqDH4MfkiboxqyWkQY3S3oStY+kdkI0FIsmhwR
 x8/ckTmN010WzxsOFa1kJoMYhZTNSxeN8oQgJkZngSXhR6IQ9MtHcw4tI5XQtQ3eHAj6
 Pp50bs3wlDgfS7ODmJ2M+xXwdEU/SRf11RAsM/EypnBTGCPtitgoabPeIkE6SEr/7um2
 rFmIquQh6agN7DO/Kc32B3Ji5FxyRn47PT9RGV62uCHuVdzJJB6+nu1ffTKsdMLXr5/K
 zOPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzIVk0ToujM6L82HXgz468uyqCKEFp/cmwkt5aPgC3TT2/+7m393F+IVihJvKYVSDxU0oO+yrYZDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0UfXyaewUCnlSjfLvc/gkhZd4BkXj9dI5phRvuXt2tIp/KU+B
 o/8ouC9Ctcjp0Vv9WVYRwggFAbanOqNazrKv0qtaKJd7bIQvY3/wY/G2VoWKQ8feqBJKxqB3hWM
 w12bHetVV/1MotdXg8bP91n1lppEqZVA3ycuJAnIRY1qRgvlYTLK51OxU+jUGBHN7qmemit0iPT
 1ZnSc=
X-Gm-Gg: ASbGncsWE9FtUBADCi4qdUNuEsSKed0sdFZztM7Xwm4ZgR6+AG0LEXhsPDt6HxTM8w/
 137oTxIqTc8sMTVAlS2+uPe2GU1c0A/QR4UljYfbUG4Wws6DygE14XHNgcpZP9DswVTFkDMFpJb
 OZxyLydCJSgZ46cYa5RvSaBpBJAXowQDKuXTCs3g5BhB9Q3Mec24GluGVuS7TGuo0aHCuPqBpgk
 urXqKH3catETsZGvbRqrmk6bGXG9ZuMbuaRpaNgQ6bzKEdLOmaM3R6ODAzlOrMJ0iHJMHQ9IYZb
 9+MzJS/cFgK9kXDd6J1Yk3O96/0FCnxHPo7/oZqWKwt/b3Y5O8/OVVx2t/CilZEL7h1JLfrgh9u
 ITQ+NiWe5QbcHmMHzPIcTWZ8MgILFnq9O4RSvoaiw1z4vA+ymyTj0hO8MMw==
X-Received: by 2002:a05:622a:130e:b0:4b5:d6db:eea1 with SMTP id
 d75a77b69052e-4e563c5da0fmr209850561cf.39.1759745556289; 
 Mon, 06 Oct 2025 03:12:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVYsEsv3GQHoe9XDvDjqIIC4TE7FK2OBx7RMlbBeqiTU7xwK2kdO72i5DVh/m7khG5Kv9KDw==
X-Received: by 2002:a05:622a:130e:b0:4b5:d6db:eea1 with SMTP id
 d75a77b69052e-4e563c5da0fmr209850151cf.39.1759745555626; 
 Mon, 06 Oct 2025 03:12:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-373ba44441dsm42561471fa.37.2025.10.06.03.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:12:34 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:12:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 4/7] drm/msm/dsi: add DSI PHY configuration on QCS8300
Message-ID: <knlsejrmxfzgb7qdy5hpiawuxfg6b5hltjpweope2hl3dm6liy@y5yop35p5afe>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-5-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006013924.1114833-5-quic_amakhija@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfXzNW1OSQbx0TF
 lOXCdsF+iTZdZoCmH6nug/7fpOA8pVFxfAJI6T1F8FzskgCL09N5J9KkMCkX83IdnUxMubdGt4i
 FcQphf3cXbGRJu2OQ37aiEtNEa2VkTgNtu7x69NV/flenmjH6Gr8wHtlEjJ7FCsqW9juvogYe3o
 H8ByKkrUy7SXu+IYiEBNJ/yofAqymCj7TdZoXae5d0H3CfB3GyJojdyS0AtwljIngEYnydawady
 Lw4nkl28lpHXX2jtWVP3yUJD+2aH36ELm9w+mXNozvDewe3k/sf8IFc7d4hxvrxFCyn4r6k//zi
 gswhC6SKBWto2uT7rd0b82kYWSOrtc+lD3da8VoAX8fMbuSK3/H9Tp8GS42SRN8+EO9BWuKl8Lf
 STPZWIckjgNDDAbvaxD2dtW1QyvJig==
X-Proofpoint-GUID: hf9_oAE7tINtrqIj_e_Gndh7QlCOAzIM
X-Proofpoint-ORIG-GUID: hf9_oAE7tINtrqIj_e_Gndh7QlCOAzIM
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e39615 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=tMqVXGxUZ0RuQ0S_Ei8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
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

On Mon, Oct 06, 2025 at 07:09:21AM +0530, Ayushi Makhija wrote:
> The QCS8300 SoC uses the 5nm (v4.2) DSI PHY driver.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 

The whole point of having the compat fallbacks is to remove the need to
modify the driver. Please review how platform bus handles binding to OF
devices.

-- 
With best wishes
Dmitry
