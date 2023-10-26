Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911AF7D8BF1
	for <lists+freedreno@lfdr.de>; Fri, 27 Oct 2023 00:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BE310E8D0;
	Thu, 26 Oct 2023 22:56:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE3710E8D0
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 22:56:30 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39QMmMXh021706; Thu, 26 Oct 2023 22:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=QuNE39pL9uhA7ikWBr/DWjgOB9r3XgvMfAUjDQ67mig=;
 b=E15AkcE0HVKIVbwte5yNBFaQeHxi/FyDj2g2A1iYuC5SqtAfOkv2/3umWvjJOPZKxoUB
 toIMPCZFsfQg3ROrhh2q1NEek4/DmFe4I8GsFUPQP+vT9xBoRogeSrvBtKUi4i1c6wYd
 NborTCxQt58sTx3CXiEXm6vNe01kvoHQI5fIAr86vKMbUM5c3gBdvSxcvRTzviclXc5M
 kMMKJ68o4cv22+8AhvqxhmVkBxdKIqcYzlhkfah8qyZr5A7uuqhn1AqrNOJgrBFwRAUa
 zDmebajex3fmbIHCfGIMlhtDillqJbl72lZ4Juy+RuI1IA9g2Qu1FYpx3b385W5OsQfZ hw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tywvt8dqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 22:56:25 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39QMuOHv010754
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 22:56:24 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Thu, 26 Oct 2023 15:56:24 -0700
Date: Thu, 26 Oct 2023 15:56:22 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20231026225622.GT3553829@hu-bjorande-lv.qualcomm.com>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jAiN9jfR8OpRC1-LVXMkz4tInl0Z2uUR
X-Proofpoint-ORIG-GUID: jAiN9jfR8OpRC1-LVXMkz4tInl0Z2uUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_22,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310260200
Subject: Re: [Freedreno] [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked'
 clock support
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 freedreno@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 03:31:24AM +0300, Dmitry Baryshkov wrote:
> clk_rcg2_shared_ops implements support for the case of the RCG which
> must not be completely turned off. However its design has one major
> drawback: it doesn't allow us to properly implement the is_enabled
> callback, which causes different kinds of misbehaviour from the CCF.

I have some behaviors in mind when reading this, others might not.
Please give some specific behavior(s) here.

Thanks,
Bjorn

> 
> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> switched off (and shared most of the implementation with
> clk_rcg2_shared_ops). The major difference is that it requires that the
> parent map doesn't conain the safe (parked) clock source. Instead if the
> CFG_REG register points to the safe source, the clock is considered to
> be disabled.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-rcg.h  |  1 +
>  drivers/clk/qcom/clk-rcg2.c | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index e6d84c8c7989..9fbbf1251564 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -176,6 +176,7 @@ extern const struct clk_ops clk_byte2_ops;
>  extern const struct clk_ops clk_pixel_ops;
>  extern const struct clk_ops clk_gfx3d_ops;
>  extern const struct clk_ops clk_rcg2_shared_ops;
> +extern const struct clk_ops clk_rcg2_parked_ops;
>  extern const struct clk_ops clk_dp_ops;
>  
>  struct clk_rcg_dfs_data {
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 5183c74b074f..3f52abf0025e 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/bitops.h>
> +#include <linux/bitfield.h>
>  #include <linux/err.h>
>  #include <linux/bug.h>
>  #include <linux/export.h>
> @@ -1150,6 +1151,39 @@ const struct clk_ops clk_rcg2_shared_ops = {
>  };
>  EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
>  
> +static int clk_rcg2_park_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> +	u32 cfg;
> +	int ret;
> +
> +	if (!clk_rcg2_is_enabled(hw))
> +		return false;
> +
> +	ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
> +	if (ret)
> +		return ret;
> +
> +	return FIELD_GET(CFG_SRC_SEL_MASK, cfg) != rcg->safe_src_index;
> +}
> +
> +/*
> + * Unlike clk_rcg2_shared_ops, the safe_src_index aka XO must NOT be present in
> + * parent_map. This allows us to implement proper is_enabled callback.
> + */
> +const struct clk_ops clk_rcg2_parked_ops = {
> +	.is_enabled = clk_rcg2_park_is_enabled,
> +	.enable = clk_rcg2_shared_enable,
> +	.disable = clk_rcg2_shared_disable,
> +	.get_parent = clk_rcg2_shared_get_parent,
> +	.set_parent = clk_rcg2_shared_set_parent,
> +	.recalc_rate = clk_rcg2_shared_recalc_rate,
> +	.determine_rate = clk_rcg2_determine_rate,
> +	.set_rate = clk_rcg2_shared_set_rate,
> +	.set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
> +};
> +EXPORT_SYMBOL_GPL(clk_rcg2_parked_ops);
> +
>  /* Common APIs to be used for DFS based RCGR */
>  static void clk_rcg2_dfs_populate_freq(struct clk_hw *hw, unsigned int l,
>  				       struct freq_tbl *f)
> -- 
> 2.39.2
> 
