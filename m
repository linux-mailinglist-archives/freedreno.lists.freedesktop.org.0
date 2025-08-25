Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29346B3496D
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 19:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A8B10E25A;
	Mon, 25 Aug 2025 17:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmFEeEtE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E404310E25A
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:56:18 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PHC6nN003654
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qZbc+LiP+W9ZiZBK8FOlQwQv
 CJhWGeKmTwDpg9afkms=; b=ZmFEeEtEHL9QS8O5lYBbwW//3Z5kDSkVvUidjwnA
 HwAmWqM8lPuO7Ay82PqQAFq15BFH8p/Pe8T14QetYMWeaLbe8DuuVGmXRajltWsL
 JU917ZPjSDacM02Xkn3wDusb3Xfvj+RC+BvbsX7IKID0RW6TximIPBRm8zNamL1L
 aagz01YHUsC19EXqbfSOK0dbiq4QUQEGM3lImG76Igt79hfAhve8NKtWih8Wch8d
 fNFh1JTJVIlcbC/tLRg62UDkBLtATeuikNmAp2aHyLdqNKqxbYGt6SxsNBFjzcWJ
 Hua46ytpuNScg/PpNmFK/Laj4jnB0w6UZqO5x0meY/xX8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5dw3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:56:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b0faa8d615so148363921cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 10:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756144577; x=1756749377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZbc+LiP+W9ZiZBK8FOlQwQvCJhWGeKmTwDpg9afkms=;
 b=ch9YQKI4zXBqSmfedqQRrShmbPRcAGUtFStU5vBjB9igS2XZl8mBkwb4rKHxwsH7rM
 rFvY0YMb+ZMu580sKXAKmzLKX3C358MBArbaSSjELL/IF6H143CE1ax87y9bTawyqIsl
 qhkJo4C+IEVTW0uVarGD4oxBg+TSydKmyooxkzVqVy4UDGqZhvEhiYuHKlMMkyX+3Oqk
 TtecfV+8s4a3Cq0+ijIyKmIlci31+cbdHQbFu4e/8z/+jTJ3u9xO9Qo52aqrhLAPfDTk
 iKl1i4EWguqls6fE/lNpxBROys/YPUa/n8Cv7V5iazrq/bmWstNGx/eLgt48YNY/b6d2
 JWiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvTaDabQWa6p1pu558FXrMuGVM+9YrK/uO4jfYJFRVOIZAuPRoDqeZVWkXjEN1VBnnEgcG9B7cPyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS7uZ+L5g1Kau5WGfRqRhr3Io7MA3U0Sbl97ZfbIGJDK1LAjPB
 DPAYBWK3rh4UxKUWJKYZP1V0jnWms5pqLjM6ikf6MthJB+8pASq2pXEcBrnjgxAzzE3YGMTGbtf
 vLQEYI0xq8cPzpD0nIHoBEPBuCC60XZhFwt/pPiRea9jDUBQcgdIza7WrxMxFiPsAGBw6vJU=
X-Gm-Gg: ASbGncubQpjYwFFDvGm19w+vpBOFtzzOw+lb8nCWPZ5UIZ2KBVOKJLy5+rYat96+eE+
 oumjgYnEIfdMlZtDDbxyefUrIB0muK73RoD3h/LL5PGc9IWKGv7GjN8VIXXQ/yq0usl09volGkT
 507URcZ1t6rNCVeFTSKNfpeyalP2Uh1P27NEdnTFhSninSWtcMwxxmXZSgryTBrkxIEfpB3aUw2
 zQmfNYZqDUDNC0LYhTbfPUUiFPc52AQ6K9lSghrSlX7zN5IMzILKOpsxp+TobBk1ABGiS47+6YJ
 H973VxcTS4rZtjCY5O6+/0KBSwEUGBKcQRY3EKgwkCILcQ/+VEJ0oHLFKsTNx/sOEf4JzRVpNmP
 5+eJLBq8w8sSHWOkv1IQWfQMfd/lQF2zrX596S1fvmbZdUZ4JoC+P
X-Received: by 2002:ac8:7c48:0:b0:4b2:9883:830d with SMTP id
 d75a77b69052e-4b2e0845a60mr7129861cf.0.1756144576978; 
 Mon, 25 Aug 2025 10:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe/SOgbCIAs7eJLZOpHwdby9mGDyCQ7MxuYmguN5qUnjk/bn2DIS68PMx9r4sIAT4GiA9z/w==
X-Received: by 2002:ac8:7c48:0:b0:4b2:9883:830d with SMTP id
 d75a77b69052e-4b2e0845a60mr7129441cf.0.1756144576374; 
 Mon, 25 Aug 2025 10:56:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f43351382sm971641e87.124.2025.08.25.10.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:56:15 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:56:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 13/38] drm/msm/dp: introduce stream_id for each DP panel
Message-ID: <wvctskhoyphicaymbm5b6kermvubhrn5u6uzui3pqf7p3a7ia2@zirqohupflvp>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-13-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-13-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX3K+NXwsnnGO8
 DUEcPwWn1JnZ2cmP6q5t2J5onDqsPpkEM0hZscxZYEixw+HmZ+8PJypcFJ4DKW7vZJOETErOMNb
 FwErmTFTkwBnSSn+auiNxbpEg1p3R/tleXDeT6z0eOBg/9dYBHqQsv3GmWAbfUdm2DbWvtThoHm
 TPzU1tFuAXVYe+Cny9kPr04RrQpfxY/EvJOU2rViJRC3N/gntmijn2YhkG8uzYz3pTRv18S4R1b
 vT2mz6roMs8WDeJ6LM8qb/m29RapCyHKe8drJ2kHIyKjpCLme9kTDirXWH4Hfpvp0LvG6kr2FTo
 GDvPCraNzRLRp6lOOa2f2tUA0QYwiXofYtVnJfxj3ftLo6LndVKmn9ayNnbg5aMh4eYaTU7KDyQ
 bl9z89rk
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68aca3c2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=esdiVXI3waKZDF_2LzQA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IsmjY4kA08ROvTI50BWpm47oIpi_lXlh
X-Proofpoint-ORIG-GUID: IsmjY4kA08ROvTI50BWpm47oIpi_lXlh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:15:59PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> With MST, each DP controller can handle multiple streams.
> There shall be one dp_panel for each stream but the dp_display
> object shall be shared among them. To represent this abstraction,
> create a stream_id for each DP panel which shall be set by the
> MST stream. For SST, default this to stream 0.
> 
> Use the stream ID to control the pixel clock of that respective
> stream by extending the clock handles and state tracking of the
> DP pixel clock to an array of max supported streams. The maximum
> streams currently is 4.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 58 ++++++++++++++++++++++---------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 11 +++++++
>  5 files changed, 73 insertions(+), 28 deletions(-)

> @@ -2677,10 +2675,11 @@ static const char *ctrl_clks[] = {
>  	"ctrl_link_iface",
>  };
>  
> -static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
> +static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl, int max_stream)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
>  	struct device *dev;
> +	char stream_id_str[15];

A comment would be nice. Or better replace this with the array lookup,
it's much easier than snprintf.

>  	int i, rc;
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> @@ -2710,9 +2709,19 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>  	if (rc)
>  		return rc;
>  
> -	ctrl->pixel_clk = devm_clk_get(dev, "stream_pixel");
> -	if (IS_ERR(ctrl->pixel_clk))
> -		return PTR_ERR(ctrl->pixel_clk);
> +	ctrl->pixel_clk[DP_STREAM_0] = devm_clk_get(dev, "stream_pixel");
> +	if (IS_ERR(ctrl->pixel_clk[DP_STREAM_0]))
> +		return PTR_ERR(ctrl->pixel_clk[DP_STREAM_0]);
> +
> +	for (i = DP_STREAM_1; i < max_stream; i++) {
> +		sprintf(stream_id_str, "stream_%d_pixel", i);
> +		ctrl->pixel_clk[i] = devm_clk_get(dev, stream_id_str);
> +
> +		if (IS_ERR(ctrl->pixel_clk[i])) {
> +			DRM_DEBUG_DP("failed to get stream %d pixel clock", i);
> +			break;
> +		}
> +	}
>  
>  	return 0;
>  }

-- 
With best wishes
Dmitry
