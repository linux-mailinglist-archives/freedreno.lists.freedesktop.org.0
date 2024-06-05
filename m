Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A6A8FD377
	for <lists+freedreno@lfdr.de>; Wed,  5 Jun 2024 19:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1139210E58A;
	Wed,  5 Jun 2024 17:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="J1IlCP45";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2626F10E58A
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jun 2024 17:01:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-4210aa00c94so662455e9.1
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jun 2024 10:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717606887; x=1718211687;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vShcTtHl89CCDyf8FYv3NuoqrMsljgaDPvth0okd418=;
 b=J1IlCP4542C6rAX60cIxuMaNhgxG5E+5raX4h1/ceNU3iKzTdC47oEP3iZ8xA/2VmS
 bkTKr4UxjGh628ZR4GP7rw4fdlXy19ouRMXKR9qYTCdaVHz0UhP9CBv2L71qHnb/NoY3
 BfdMLiOHvjTGdl88iVQ6ipUSLdIjdIpZBMOhW1RLVa+YRQG+F6HTGBg3ZTWXTsMaCLbw
 HMlx3HFqjOUbK+LT0VEBfDjXyRzOZIjIrBiyRR6EFce9onGMYhp6w0oa8bwcsgTzGP+k
 aKjrfvo08R8B/e7onfB9oBm5oLqbm9L7x8ez/JcGVffn06jnP07K/fnUXkNRVlWkXZhf
 i89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717606887; x=1718211687;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vShcTtHl89CCDyf8FYv3NuoqrMsljgaDPvth0okd418=;
 b=U7diHXFjHaXMdAU8hgXOBlDRm4cwKLbEYqhwHJuRLjrtxaHE0gLD536fDGhz8WXVL0
 H8+GResgBzUe+wcRATMIip+lrewykxc/wcbPifsh704u8RXFPsQYzdyIFQwED8Lnc7Bi
 NgcyL6GwWMVeuN84fEZ3Xx7O7Ij80so9PdEaKZUwOiL7bExvX9toIPu9FxwviRElucRh
 P71lB48D0rBew+mcsBafwTtgRvFsSAyambzlAU7i0c2vdPd/s03Pu80RXPJOPlRJB6YL
 OnQk4maX0bJrcAJ/ivIUPkzre66f51ycM03yoithBezNxdMfYIVkmIOhF7KHLfgoQTUr
 5yMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA2zF3yPz407E5PWXKEf27980EsC/QxNnQDMjwnOZW4zyDcGDQoCNAvXb7UY5lDeVs2fTpkmM8KywsyQ2k/iMy0s5ZE1anhlTN2vZe1/Ef
X-Gm-Message-State: AOJu0YwEU2smhuke+A5k6RXMRBy+IoYw/H7guuf/wgJRRnELCLo3gE9v
 fFMdSnnP/FOTjJvASGzBCFHyPxCxRwG192jRlS8X9NvvJ7gO1GtLYGXapSHHckg=
X-Google-Smtp-Source: AGHT+IFpCQPc9gHNh2vQP+d69J/apCdAzRtIdO+7OaC59hSTal0RIdQ7skEd8lYbH06gRnB2GXj3dQ==
X-Received: by 2002:a5d:6792:0:b0:35e:83c0:82e5 with SMTP id
 ffacd0b85a97d-35e84057c6emr2207377f8f.11.1717606886607; 
 Wed, 05 Jun 2024 10:01:26 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:6d7a:60e1:8a50:fd0c?
 ([2a01:e34:ec24:52e0:6d7a:60e1:8a50:fd0c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04da182sm15101018f8f.54.2024.06.05.10.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 10:01:26 -0700 (PDT)
Message-ID: <f9ca4c45-45f3-4007-a808-3067800a798a@freebox.fr>
Date: Wed, 5 Jun 2024 19:01:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] drm/msm: add msm8998 hdmi phy/pll support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <63337d63-67ef-4499-8a24-5f6e9285c36b@freebox.fr>
 <CAA8EJpptbpRj2htzcsXAiwQe-1Xdgoev-mdMki2OApm3gMEBcw@mail.gmail.com>
 <e4c2e552-9004-4735-a3b3-ba1f50a145ac@freebox.fr>
 <ow3p535eidouzd4jwsqe7kogkley4axmk7nj6rhimimijezuz2@2qmfyhptrx2u>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <ow3p535eidouzd4jwsqe7kogkley4axmk7nj6rhimimijezuz2@2qmfyhptrx2u>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 28/05/2024 02:15, Dmitry Baryshkov wrote:

> In the end, msm8998 uses what looks like QMP v3 with a different TX
> register set

Patch diff currently looks like this:

 drivers/gpu/drm/msm/Makefile                   |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h                |   8 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c            |   5 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c       | 795 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/registers/display/hdmi.xml |  89 +++
 6 files changed, 899 insertions(+)

I'll post hdmi_phy_8998.c below for easy reference,
but Arnaud might want me to have a closer look at
pll_get_post_div()

Though I must confess, if the code works as it is now,
why look for a different solution, especially if it's
going to be factorized again in a few weeks?

pll_get_cpctrl() and pll_get_rctrl() looks a bit odd.



// SPDX-License-Identifier: GPL-2.0-only
/*
 * Copyright (c) 2016, The Linux Foundation. All rights reserved.
 * Copyright (c) 2024 Freebox SAS
 */

#include <linux/clk-provider.h>
#include <linux/delay.h>

#include "hdmi.h"

#define HDMI_VCO_MAX_FREQ			12000000000UL
#define HDMI_VCO_MIN_FREQ			8000000000UL

#define HDMI_PCLK_MAX_FREQ			600000000
#define HDMI_PCLK_MIN_FREQ			25000000

#define HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD	3400000000UL
#define HDMI_DIG_FREQ_BIT_CLK_THRESHOLD		1500000000UL
#define HDMI_MID_FREQ_BIT_CLK_THRESHOLD		750000000UL
#define HDMI_CORECLK_DIV			5
#define HDMI_DEFAULT_REF_CLOCK			19200000
#define HDMI_PLL_CMP_CNT			1024

#define HDMI_PLL_POLL_MAX_READS			100
#define HDMI_PLL_POLL_TIMEOUT_US		150

#define HDMI_NUM_TX_CHANNEL			4

struct hdmi_pll_8998 {
	struct platform_device *pdev;
	struct clk_hw clk_hw;
	unsigned long rate;

	/* pll mmio base */
	void __iomem *mmio_qserdes_com;
	/* tx channel base */
	void __iomem *mmio_qserdes_tx[HDMI_NUM_TX_CHANNEL];
};

#define hw_clk_to_pll(x) container_of(x, struct hdmi_pll_8998, clk_hw)

struct hdmi_8998_phy_pll_reg_cfg {
	u32 com_svs_mode_clk_sel;
	u32 com_hsclk_sel;
	u32 com_pll_cctrl_mode0;
	u32 com_pll_rctrl_mode0;
	u32 com_cp_ctrl_mode0;
	u32 com_dec_start_mode0;
	u32 com_div_frac_start1_mode0;
	u32 com_div_frac_start2_mode0;
	u32 com_div_frac_start3_mode0;
	u32 com_integloop_gain0_mode0;
	u32 com_integloop_gain1_mode0;
	u32 com_lock_cmp_en;
	u32 com_lock_cmp1_mode0;
	u32 com_lock_cmp2_mode0;
	u32 com_lock_cmp3_mode0;
	u32 com_core_clk_en;
	u32 com_coreclk_div_mode0;

	u32 tx_lx_tx_band[HDMI_NUM_TX_CHANNEL];
	u32 tx_lx_tx_drv_lvl[HDMI_NUM_TX_CHANNEL];
	u32 tx_lx_tx_emp_post1_lvl[HDMI_NUM_TX_CHANNEL];
	u32 tx_lx_pre_driver_1[HDMI_NUM_TX_CHANNEL];
	u32 tx_lx_pre_driver_2[HDMI_NUM_TX_CHANNEL];
	u32 tx_lx_res_code_offset[HDMI_NUM_TX_CHANNEL];

	u32 phy_mode;
};

struct hdmi_8998_post_divider {
	u64 vco_freq;
	int hsclk_divsel;
	int vco_ratio;
	int tx_band_sel;
	int half_rate_mode;
};

static inline struct hdmi_phy *pll_get_phy(struct hdmi_pll_8998 *pll)
{
	return platform_get_drvdata(pll->pdev);
}

static inline void hdmi_pll_write(struct hdmi_pll_8998 *pll, int offset,
				  u32 data)
{
	writel(data, pll->mmio_qserdes_com + offset);
}

static inline u32 hdmi_pll_read(struct hdmi_pll_8998 *pll, int offset)
{
	return readl(pll->mmio_qserdes_com + offset);
}

static inline void hdmi_tx_chan_write(struct hdmi_pll_8998 *pll, int channel,
				      int offset, int data)
{
	 writel(data, pll->mmio_qserdes_tx[channel] + offset);
}

static inline u32 pll_get_cpctrl(u64 frac_start, unsigned long ref_clk,
				 bool gen_ssc)
{
	if ((frac_start != 0) || gen_ssc)
		return 0x8;

	return 0x30;
}

static inline u32 pll_get_rctrl(u64 frac_start, bool gen_ssc)
{
	if ((frac_start != 0) || gen_ssc)
		return 0x16;

	return 0x18;
}

static inline u32 pll_get_cctrl(u64 frac_start, bool gen_ssc)
{
	if ((frac_start != 0) || gen_ssc)
		return 0x34;

	return 0x2;
}

static inline u32 pll_get_integloop_gain(u64 frac_start, u64 bclk, u32 ref_clk,
					 bool gen_ssc)
{
	int digclk_divsel = bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD ? 1 : 2;
	u64 base;

	if ((frac_start != 0) || gen_ssc)
		base = 0x3F;
	else
		base = 0xC4;

	base <<= (digclk_divsel == 2 ? 1 : 0);

	return (base <= 2046 ? base : 2046);
}

static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
{
	u64 dividend = HDMI_PLL_CMP_CNT * fdata;
	u32 divisor = ref_clk * 10;
	u32 rem;

	rem = do_div(dividend, divisor);
	if (rem > (divisor >> 1))
		dividend++;

	return dividend - 1;
}

static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
{
	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;

	do_div(fdata, HDMI_PLL_CMP_CNT);

	return fdata;
}

#define HDMI_REF_CLOCK_HZ ((u64)19200000)
#define HDMI_MHZ_TO_HZ ((u64)1000000)
static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
{
	u32 const ratio_list[] = {1, 2, 3, 4, 5, 6,
				     9, 10, 12, 15, 25};
	u32 const band_list[] = {0, 1, 2, 3};
	u32 const sz_ratio = ARRAY_SIZE(ratio_list);
	u32 const sz_band = ARRAY_SIZE(band_list);
	u32 const cmp_cnt = 1024;
	u32 const th_min = 500, th_max = 1000;
	u32 half_rate_mode = 0;
	u32 list_elements;
	int optimal_index;
	u32 i, j, k;
	u32 found_hsclk_divsel = 0, found_vco_ratio;
	u32 found_tx_band_sel;
	u64 const min_freq = HDMI_VCO_MIN_FREQ, max_freq = HDMI_VCO_MAX_FREQ;
	u64 freq_list[ARRAY_SIZE(ratio_list) * ARRAY_SIZE(band_list)];
	u64 found_vco_freq;
	u64 freq_optimal;

find_optimal_index:
	freq_optimal = max_freq;
	optimal_index = -1;
	list_elements = 0;

	for (i = 0; i < sz_ratio; i++) {
		for (j = 0; j < sz_band; j++) {
			u64 freq = div_u64(bclk, (1 << half_rate_mode));

			freq *= (ratio_list[i] * (1 << band_list[j]));
			freq_list[list_elements++] = freq;
		}
	}

	for (k = 0; k < ARRAY_SIZE(freq_list); k++) {
		u32 const clks_pll_div = 2, core_clk_div = 5;
		u32 const rng1 = 16, rng2 = 8;
		u32 th1, th2;
		u64 core_clk, rvar1, rem;

		core_clk = (((freq_list[k] /
			      ratio_list[k / sz_band]) /
			      clks_pll_div) / core_clk_div);

		rvar1 = HDMI_REF_CLOCK_HZ * rng1 * HDMI_MHZ_TO_HZ;
		rvar1 = div64_u64_rem(rvar1, (cmp_cnt * core_clk), &rem);
		if (rem > ((cmp_cnt * core_clk) >> 1))
			rvar1++;
		th1 = rvar1;

		rvar1 = HDMI_REF_CLOCK_HZ * rng2 * HDMI_MHZ_TO_HZ;
		rvar1 = div64_u64_rem(rvar1, (cmp_cnt * core_clk), &rem);
		if (rem > ((cmp_cnt * core_clk) >> 1))
			rvar1++;
		th2 = rvar1;

		if (freq_list[k] >= min_freq &&
				freq_list[k] <= max_freq) {
			if ((th1 >= th_min && th1 <= th_max) ||
					(th2 >= th_min && th2 <= th_max)) {
				if (freq_list[k] <= freq_optimal) {
					freq_optimal = freq_list[k];
					optimal_index = k;
				}
			}
		}
	}

	if (optimal_index == -1) {
		if (!half_rate_mode) {
			half_rate_mode = 1;
			goto find_optimal_index;
		} else {
			return -EINVAL;
		}
	} else {
		found_vco_ratio = ratio_list[optimal_index / sz_band];
		found_tx_band_sel = band_list[optimal_index % sz_band];
		found_vco_freq = freq_optimal;
	}

	switch (found_vco_ratio) {
	case 1:
		found_hsclk_divsel = 15;
		break;
	case 2:
		found_hsclk_divsel = 0;
		break;
	case 3:
		found_hsclk_divsel = 4;
		break;
	case 4:
		found_hsclk_divsel = 8;
		break;
	case 5:
		found_hsclk_divsel = 12;
		break;
	case 6:
		found_hsclk_divsel = 1;
		break;
	case 9:
		found_hsclk_divsel = 5;
		break;
	case 10:
		found_hsclk_divsel = 2;
		break;
	case 12:
		found_hsclk_divsel = 9;
		break;
	case 15:
		found_hsclk_divsel = 13;
		break;
	case 25:
		found_hsclk_divsel = 14;
		break;
	};

	pd->vco_freq = found_vco_freq;
	pd->tx_band_sel = found_tx_band_sel;
	pd->vco_ratio = found_vco_ratio;
	pd->hsclk_divsel = found_hsclk_divsel;

	return 0;
}

static int pll_calculate(unsigned long pix_clk, unsigned long ref_clk,
			 struct hdmi_8998_phy_pll_reg_cfg *cfg)
{
	struct hdmi_8998_post_divider pd;
	u64 bclk;
	u64 tmds_clk;
	u64 dec_start;
	u64 frac_start;
	u64 fdata;
	u32 pll_divisor;
	u32 rem;
	u32 cpctrl;
	u32 rctrl;
	u32 cctrl;
	u32 integloop_gain;
	u32 pll_cmp;
	int i, ret;

	/* bit clk = 10 * pix_clk */
	bclk = ((u64)pix_clk) * 10;

	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD)
		tmds_clk = pix_clk >> 2;
	else
		tmds_clk = pix_clk;

	ret = pll_get_post_div(&pd, bclk);
	if (ret)
		return ret;

	dec_start = pd.vco_freq;
	pll_divisor = 4 * ref_clk;
	do_div(dec_start, pll_divisor);

	frac_start = pd.vco_freq * (1 << 20);

	rem = do_div(frac_start, pll_divisor);
	frac_start -= dec_start * (1 << 20);
	if (rem > (pll_divisor >> 1))
		frac_start++;

	cpctrl = pll_get_cpctrl(frac_start, ref_clk, false);
	rctrl = pll_get_rctrl(frac_start, false);
	cctrl = pll_get_cctrl(frac_start, false);
	integloop_gain = pll_get_integloop_gain(frac_start, bclk,
						ref_clk, false);

	fdata = pd.vco_freq;
	do_div(fdata, pd.vco_ratio);

	pll_cmp = pll_get_pll_cmp(fdata, ref_clk);

	/* Convert these values to register specific values */
	if (bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD)
		cfg->com_svs_mode_clk_sel = 1;
	else
		cfg->com_svs_mode_clk_sel = 2;

	cfg->com_hsclk_sel = (0x20 | pd.hsclk_divsel);
	cfg->com_pll_cctrl_mode0 = cctrl;
	cfg->com_pll_rctrl_mode0 = rctrl;
	cfg->com_cp_ctrl_mode0 = cpctrl;
	cfg->com_dec_start_mode0 = dec_start;
	cfg->com_div_frac_start1_mode0 = (frac_start & 0xff);
	cfg->com_div_frac_start2_mode0 = ((frac_start & 0xff00) >> 8);
	cfg->com_div_frac_start3_mode0 = ((frac_start & 0xf0000) >> 16);
	cfg->com_integloop_gain0_mode0 = (integloop_gain & 0xff);
	cfg->com_integloop_gain1_mode0 = ((integloop_gain & 0xf00) >> 8);
	cfg->com_lock_cmp1_mode0 = (pll_cmp & 0xff);
	cfg->com_lock_cmp2_mode0 = ((pll_cmp & 0xff00) >> 8);
	cfg->com_lock_cmp3_mode0 = ((pll_cmp & 0x30000) >> 16);
	cfg->com_lock_cmp_en = 0x0;
	cfg->com_core_clk_en = 0x2c;
	cfg->com_coreclk_div_mode0 = HDMI_CORECLK_DIV;
	cfg->phy_mode = (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD) ? 0x5 : 0x4;

	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++)
		cfg->tx_lx_tx_band[i] = pd.tx_band_sel;

	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD) {
		cfg->tx_lx_tx_drv_lvl[0] = 0x0f;
		cfg->tx_lx_tx_drv_lvl[1] = 0x0f;
		cfg->tx_lx_tx_drv_lvl[2] = 0x0f;
		cfg->tx_lx_tx_drv_lvl[3] = 0x0f;
		cfg->tx_lx_tx_emp_post1_lvl[0] = 0x03;
		cfg->tx_lx_tx_emp_post1_lvl[1] = 0x02;
		cfg->tx_lx_tx_emp_post1_lvl[2] = 0x03;
		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x00;
		cfg->tx_lx_pre_driver_1[0] = 0x00;
		cfg->tx_lx_pre_driver_1[1] = 0x00;
		cfg->tx_lx_pre_driver_1[2] = 0x00;
		cfg->tx_lx_pre_driver_1[3] = 0x00;
		cfg->tx_lx_pre_driver_2[0] = 0x1C;
		cfg->tx_lx_pre_driver_2[1] = 0x1C;
		cfg->tx_lx_pre_driver_2[2] = 0x1C;
		cfg->tx_lx_pre_driver_2[3] = 0x00;
		cfg->tx_lx_res_code_offset[0] = 0x03;
		cfg->tx_lx_res_code_offset[1] = 0x00;
		cfg->tx_lx_res_code_offset[2] = 0x00;
		cfg->tx_lx_res_code_offset[3] = 0x03;
	} else if (bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD) {
		cfg->tx_lx_tx_drv_lvl[0] = 0x0f;
		cfg->tx_lx_tx_drv_lvl[1] = 0x0f;
		cfg->tx_lx_tx_drv_lvl[2] = 0x0f;
		cfg->tx_lx_tx_drv_lvl[3] = 0x0f;
		cfg->tx_lx_tx_emp_post1_lvl[0] = 0x03;
		cfg->tx_lx_tx_emp_post1_lvl[1] = 0x03;
		cfg->tx_lx_tx_emp_post1_lvl[2] = 0x03;
		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x00;
		cfg->tx_lx_pre_driver_1[0] = 0x00;
		cfg->tx_lx_pre_driver_1[1] = 0x00;
		cfg->tx_lx_pre_driver_1[2] = 0x00;
		cfg->tx_lx_pre_driver_1[3] = 0x00;
		cfg->tx_lx_pre_driver_2[0] = 0x16;
		cfg->tx_lx_pre_driver_2[1] = 0x16;
		cfg->tx_lx_pre_driver_2[2] = 0x16;
		cfg->tx_lx_pre_driver_2[3] = 0x18;
		cfg->tx_lx_res_code_offset[0] = 0x03;
		cfg->tx_lx_res_code_offset[1] = 0x00;
		cfg->tx_lx_res_code_offset[2] = 0x00;
		cfg->tx_lx_res_code_offset[3] = 0x00;
	} else if (bclk > HDMI_MID_FREQ_BIT_CLK_THRESHOLD) {
		cfg->tx_lx_tx_drv_lvl[0] = 0x0f;
		cfg->tx_lx_tx_drv_lvl[1] = 0x0f;
		cfg->tx_lx_tx_drv_lvl[2] = 0x0f;
		cfg->tx_lx_tx_drv_lvl[3] = 0x0f;
		cfg->tx_lx_tx_emp_post1_lvl[0] = 0x05;
		cfg->tx_lx_tx_emp_post1_lvl[1] = 0x05;
		cfg->tx_lx_tx_emp_post1_lvl[2] = 0x05;
		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x00;
		cfg->tx_lx_pre_driver_1[0] = 0x00;
		cfg->tx_lx_pre_driver_1[1] = 0x00;
		cfg->tx_lx_pre_driver_1[2] = 0x00;
		cfg->tx_lx_pre_driver_1[3] = 0x00;
		cfg->tx_lx_pre_driver_2[0] = 0x0E;
		cfg->tx_lx_pre_driver_2[1] = 0x0E;
		cfg->tx_lx_pre_driver_2[2] = 0x0E;
		cfg->tx_lx_pre_driver_2[3] = 0x0E;
		cfg->tx_lx_res_code_offset[0] = 0x00;
		cfg->tx_lx_res_code_offset[1] = 0x00;
		cfg->tx_lx_res_code_offset[2] = 0x00;
		cfg->tx_lx_res_code_offset[3] = 0x00;
	} else {
		cfg->tx_lx_tx_drv_lvl[0] = 0x01;
		cfg->tx_lx_tx_drv_lvl[1] = 0x01;
		cfg->tx_lx_tx_drv_lvl[2] = 0x01;
		cfg->tx_lx_tx_drv_lvl[3] = 0x00;
		cfg->tx_lx_tx_emp_post1_lvl[0] = 0x00;
		cfg->tx_lx_tx_emp_post1_lvl[1] = 0x00;
		cfg->tx_lx_tx_emp_post1_lvl[2] = 0x00;
		cfg->tx_lx_tx_emp_post1_lvl[3] = 0x00;
		cfg->tx_lx_pre_driver_1[0] = 0x00;
		cfg->tx_lx_pre_driver_1[1] = 0x00;
		cfg->tx_lx_pre_driver_1[2] = 0x00;
		cfg->tx_lx_pre_driver_1[3] = 0x00;
		cfg->tx_lx_pre_driver_2[0] = 0x16;
		cfg->tx_lx_pre_driver_2[1] = 0x16;
		cfg->tx_lx_pre_driver_2[2] = 0x16;
		cfg->tx_lx_pre_driver_2[3] = 0x18;
		cfg->tx_lx_res_code_offset[0] = 0x00;
		cfg->tx_lx_res_code_offset[1] = 0x00;
		cfg->tx_lx_res_code_offset[2] = 0x00;
		cfg->tx_lx_res_code_offset[3] = 0x00;
	}

	return 0;
}

static int hdmi_8998_pll_set_clk_rate(struct clk_hw *hw, unsigned long rate,
				      unsigned long parent_rate)
{
	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
	struct hdmi_phy *phy = pll_get_phy(pll);
	struct hdmi_8998_phy_pll_reg_cfg cfg;
	int i, ret;

	printk(KERN_INFO "hdmi_8998_pll_set_clk_rate %lu %lu\n", rate, parent_rate);

	/* FIXME: support atomic update ? */

	memset(&cfg, 0x00, sizeof(cfg));

	ret = pll_calculate(rate, parent_rate, &cfg);
	if (ret) {
		DRM_ERROR("PLL calculation failed\n");
		return ret;
	}

	/* Initially shut down PHY */
	hdmi_phy_write(phy, REG_HDMI_8998_PHY_PD_CTL, 0x0);
	udelay(500);

	/* Power up sequence */
	hdmi_phy_write(phy, REG_HDMI_8998_PHY_PD_CTL, 0x1);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_RESETSM_CNTRL, 0x20);
	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CMN_CTRL, 0x6);

	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
		hdmi_tx_chan_write(pll, i,
				   REG_HDMI_8998_PHY_TXn_INTERFACE_SELECT_TX_BAND,
				   cfg.tx_lx_tx_band[i]);
		hdmi_tx_chan_write(pll, i,
				   REG_HDMI_8998_PHY_TXn_CLKBUF_TERM_ENABLE,
				   0x1);
		hdmi_tx_chan_write(pll, i,
				   REG_HDMI_8998_PHY_TXn_LANE_MODE,
				   0x20);
	}

	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_BUF_ENABLE, 0x02);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x0B);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_EN_SEL, 0x37);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SYS_CLK_CTRL, 0x02);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CLK_ENABLE1, 0x0E);

	/* Bypass VCO calibration */
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_SVS_MODE_CLK_SEL,
		       cfg.com_svs_mode_clk_sel);

	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_PLL_IVCO, 0x07);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_CTRL, 0x00);

	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CLK_SEL, 0x30);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_HSCLK_SEL,
		       cfg.com_hsclk_sel);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP_EN,
		       cfg.com_lock_cmp_en);

	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_PLL_CCTRL_MODE0,
		       cfg.com_pll_cctrl_mode0);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_PLL_RCTRL_MODE0,
		       cfg.com_pll_rctrl_mode0);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CP_CTRL_MODE0,
		       cfg.com_cp_ctrl_mode0);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_DEC_START_MODE0,
		       cfg.com_dec_start_mode0);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START1_MODE0,
		       cfg.com_div_frac_start1_mode0);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START2_MODE0,
		       cfg.com_div_frac_start2_mode0);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START3_MODE0,
		       cfg.com_div_frac_start3_mode0);

	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN0_MODE0,
		       cfg.com_integloop_gain0_mode0);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN1_MODE0,
		       cfg.com_integloop_gain1_mode0);

	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP1_MODE0,
		       cfg.com_lock_cmp1_mode0);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP2_MODE0,
		       cfg.com_lock_cmp2_mode0);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP3_MODE0,
		       cfg.com_lock_cmp3_mode0);

	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_MAP, 0x00);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CORE_CLK_EN,
		       cfg.com_core_clk_en);
	hdmi_pll_write(pll, REG_HDMI_8998_PHY_QSERDES_COM_CORECLK_DIV_MODE0,
		       cfg.com_coreclk_div_mode0);

	/* TX lanes setup (TX 0/1/2/3) */
	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
		hdmi_tx_chan_write(pll, i,
				   REG_HDMI_8998_PHY_TXn_DRV_LVL,
				   cfg.tx_lx_tx_drv_lvl[i]);
		hdmi_tx_chan_write(pll, i,
				   REG_HDMI_8998_PHY_TXn_EMP_POST1_LVL,
				   cfg.tx_lx_tx_emp_post1_lvl[i]);
		hdmi_tx_chan_write(pll, i,
				   REG_HDMI_8998_PHY_TXn_PRE_DRIVER_1,
				   cfg.tx_lx_pre_driver_1[i]);
		hdmi_tx_chan_write(pll, i,
				   REG_HDMI_8998_PHY_TXn_PRE_DRIVER_2,
				   cfg.tx_lx_pre_driver_2[i]);
		hdmi_tx_chan_write(pll, i,
				   REG_HDMI_8998_PHY_TXn_DRV_LVL_RES_CODE_OFFSET,
				   cfg.tx_lx_res_code_offset[i]);
	}

	hdmi_phy_write(phy, REG_HDMI_8998_PHY_MODE, cfg.phy_mode);

	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
		hdmi_tx_chan_write(pll, i,
				   REG_HDMI_8998_PHY_TXn_LANE_CONFIG,
				   0x10);
	}

	/*
	 * Ensure that vco configuration gets flushed to hardware before
	 * enabling the PLL
	 */
	wmb();

	pll->rate = rate;

	return 0;
}

static int hdmi_8998_phy_ready_status(struct hdmi_phy *phy)
{
	u32 nb_tries = HDMI_PLL_POLL_MAX_READS;
	unsigned long timeout = HDMI_PLL_POLL_TIMEOUT_US;
	u32 status;
	int phy_ready = 0;

	while (nb_tries--) {
		status = hdmi_phy_read(phy, REG_HDMI_8998_PHY_STATUS);
		phy_ready = status & BIT(0);

		if (phy_ready)
			break;

		udelay(timeout);
	}

	return phy_ready;
}

static int hdmi_8998_pll_lock_status(struct hdmi_pll_8998 *pll)
{
	u32 status;
	int nb_tries = HDMI_PLL_POLL_MAX_READS;
	unsigned long timeout = HDMI_PLL_POLL_TIMEOUT_US;
	int pll_locked = 0;

	while (nb_tries--) {
		status = hdmi_pll_read(pll,
				       REG_HDMI_8998_PHY_QSERDES_COM_C_READY_STATUS);
		pll_locked = status & BIT(0);

		if (pll_locked)
			break;

		udelay(timeout);
	}

	return pll_locked;
}

static int hdmi_8998_pll_prepare(struct clk_hw *hw)
{
	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
	struct hdmi_phy *phy = pll_get_phy(pll);
	int i, ret = 0;

	printk(KERN_INFO "hdmi_8998_pll_prepare\n");

	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x1);
	udelay(100);

	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x59);
	udelay(100);

	ret = hdmi_8998_pll_lock_status(pll);
	if (!ret)
		return ret;

	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
		hdmi_tx_chan_write(pll, i,
				   REG_HDMI_8998_PHY_TXn_LANE_CONFIG, 0x1F);
	}

	/* Ensure all registers are flushed to hardware */
	wmb();

	ret = hdmi_8998_phy_ready_status(phy);
	if (!ret)
		return ret;

	/* Restart the retiming buffer */
	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x58);
	udelay(1);
	hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x59);

	/* Ensure all registers are flushed to hardware */
	wmb();

	return 0;
}

static long hdmi_8998_pll_round_rate(struct clk_hw *hw,
				     unsigned long rate,
				     unsigned long *parent_rate)
{
	if (rate < HDMI_PCLK_MIN_FREQ)
		return HDMI_PCLK_MIN_FREQ;
	else if (rate > HDMI_PCLK_MAX_FREQ)
		return HDMI_PCLK_MAX_FREQ;
	else
		return rate;
}

static unsigned long hdmi_8998_pll_recalc_rate(struct clk_hw *hw,
					       unsigned long parent_rate)
{
	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
	return pll->rate;
}

static void hdmi_8998_pll_unprepare(struct clk_hw *hw)
{
	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
	struct hdmi_phy *phy = pll_get_phy(pll);

	printk(KERN_INFO "hdmi_8998_pll_unprepare\n");

	hdmi_phy_write(phy, REG_HDMI_8998_PHY_PD_CTL, 0);
	usleep_range(100, 150);
}

static int hdmi_8998_pll_is_enabled(struct clk_hw *hw)
{
	struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
	u32 status;
	int pll_locked;

	status = hdmi_pll_read(pll, REG_HDMI_8998_PHY_QSERDES_COM_C_READY_STATUS);
	pll_locked = status & BIT(0);

	return pll_locked;
}

static const struct clk_ops hdmi_8998_pll_ops = {
	.set_rate = hdmi_8998_pll_set_clk_rate,
	.round_rate = hdmi_8998_pll_round_rate,
	.recalc_rate = hdmi_8998_pll_recalc_rate,
	.prepare = hdmi_8998_pll_prepare,
	.unprepare = hdmi_8998_pll_unprepare,
	.is_enabled = hdmi_8998_pll_is_enabled,
};

static const struct clk_init_data pll_init = {
	.name = "hdmipll",
	.ops = &hdmi_8998_pll_ops,
	.parent_data = (const struct clk_parent_data[]){
		{ .fw_name = "xo", .name = "xo_board" },
	},
	.num_parents = 1,
	.flags = CLK_IGNORE_UNUSED,
};

int msm_hdmi_pll_8998_init(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	struct hdmi_pll_8998 *pll;
	int ret, i;

	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
	if (!pll)
		return -ENOMEM;

	pll->pdev = pdev;

	pll->mmio_qserdes_com = msm_ioremap(pdev, "hdmi_pll");
	if (IS_ERR(pll->mmio_qserdes_com)) {
		DRM_DEV_ERROR(dev, "failed to map pll base\n");
		return -ENOMEM;
	}

	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
		char name[32];

		snprintf(name, sizeof(name), "hdmi_tx_l%d", i);

		pll->mmio_qserdes_tx[i] = msm_ioremap(pdev, name);
		if (IS_ERR(pll->mmio_qserdes_tx[i])) {
			DRM_DEV_ERROR(dev, "failed to map pll base\n");
			return -ENOMEM;
		}
	}
	pll->clk_hw.init = &pll_init;

	ret = devm_clk_hw_register(dev, &pll->clk_hw);
	if (ret) {
		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
		return ret;
	}

	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
	if (ret) {
		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
		return ret;
	}

	return 0;
}

static const char * const hdmi_phy_8998_reg_names[] = {
	"vdda-pll",
	"vdda-phy",
};

static const char * const hdmi_phy_8998_clk_names[] = {
	"iface", "ref", "xo",
};

const struct hdmi_phy_cfg msm_hdmi_phy_8998_cfg = {
	.type = MSM_HDMI_PHY_8998,
	.reg_names = hdmi_phy_8998_reg_names,
	.num_regs = ARRAY_SIZE(hdmi_phy_8998_reg_names),
	.clk_names = hdmi_phy_8998_clk_names,
	.num_clks = ARRAY_SIZE(hdmi_phy_8998_clk_names),
};

