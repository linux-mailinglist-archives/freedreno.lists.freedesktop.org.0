Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E54C16ABB
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 20:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2531E10E651;
	Tue, 28 Oct 2025 19:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbeHfU3J";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNCBUI89";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E76110E650
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 19:52:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlOPB2523778
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 19:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YT9nBxzRwOGhdaFlMTQmBnzt
 oTUtZuh0+unpXnt98jU=; b=KbeHfU3JRqpFXUFIctk/erizrZMhz7eVjxQGiE9A
 bvCzEwUSm7lB1OBjphhTzRDHqidu+X0ysM8A4tysMURANiUt9yeQD09CqD24KnxM
 O3z/YNg+OKIb6LcK6BJFaO2Da8sqS54QVK3T7mIpKATTCeugFYpq35EUOb180KGI
 cmUNOHi8c0ZjgRZ9IjEbOS1EAdjQ0A+aqgb1026JNLsk8UxQitR4I+DeLUbb7iv8
 raPIwJSINHg61113g31llPbN6tWm//wTSire9HoemHL29OvtDDuf5no9qBZZlU5Q
 0s1K6e8VrUXG+fyb12VV7FL0Gb5F4Wx7ruvnHxU56PjSqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1r0b5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 19:52:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e894937010so179051501cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 12:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761681151; x=1762285951;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YT9nBxzRwOGhdaFlMTQmBnztoTUtZuh0+unpXnt98jU=;
 b=KNCBUI89dp65l551WfAnJsegtaZtcppSZFo86ZNAY9A2cDB3g79TKdYw6y93aXgVHE
 JIHKbfpMll126idy+KBinmJ9o5oDp3ZJVMXiruQIOkxXoM5lnWzwnd8ubePYEeDBynRH
 y12ayJF4TNd1pvIGIaQIPg7e44uzWDFi+oi557Ec+a8riBCeHckKJo5KIsT40LbV1bIG
 XlDWVu8j/uJI0T34VLCwY6Skp5i83hyP6DpanSMtvw1JD/qGkBukiwGUzkwEvz68xEyS
 /hGe9jRUS7L/Y0drSnwglSG5/xk5FHb33HBaK8rDCF6vHLrHbmrpPkZ7euK+hJjXrCUu
 ah6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761681151; x=1762285951;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YT9nBxzRwOGhdaFlMTQmBnztoTUtZuh0+unpXnt98jU=;
 b=YV76z23nVUcZQeXBI5cgN6/1uRWR9/wMSXf5uqiwwCdqjre3VKgsV8xJ5CBWywlRgL
 F42wDr+1BOny72wJxiWHNQlBRKBk6mhQ+WsITuFPArZIwihJDy0uIwC2D0dBi3uENR2L
 lMAd/ze2zwpGfeDgbm+41JBGu5HKpm1y+dKxwbpjYvlWZ7fzsaZjYaZ3bEQ/0MpxCyuL
 Z3cgBNfjIYlvk6YUA7iIvkT6B7NDQZJQWhGlWdNo6mlP1Foj5556cVr4fi0Bt4V9X/Mm
 mDgz8B5tOjaOjkPtp9zcFuRVuy3y2UFHL4ivqIM4pqY5JuKaS6ldizAxQW9P4x43lEJ8
 VtjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8r+GTO0YRPdlY0f5CZkc58kBmS80VCnVFoLS+zRfhOjQhoWofrBF5cfVnLcE8xXYI3mmUnyo3gvQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhJOHrlGOFrzu3zf3gj36CEvqvM9EL9TkdbQtKSH/5r1ZQeQ4B
 KhJY7I/YWKDArR405YFT6cYzHW2iCzZ1YGS8dvK0Y0CTgCNgBGUKlY4cv7fH3Jb/sb8wHU1zERE
 i3BLz76u8cPatbtulhkoxRDg/yK9FMP38yyos2N66jIvl5tWye89N1CihdTF+9rWaA99iCEA=
X-Gm-Gg: ASbGncsa+G6xCUBjk8C/rV7MArOE+wP4b6H1bqOaMHveW7NoDNA8Low8+u2fNAGgaG8
 eeW9RO8JQs5DBLdrA/OO36rLIUhc0v93tnvQtbzOwPF78dQT6NXkyxAqmB5q/03V8sk0u4QQ7pq
 Jm/ZcSKoAIa7S8YWr010IA+eC0aZIaooK1TPXywDPyZaq3QCElza8c88kbvbQBur4hcnYAJ+x/e
 WILr0rBg4sLoFQXkXt5q51AnDYnQtuyY64Tn1TjCbCUs5S9Z1HLz50xQDv33ydWgfBV61qVMW9u
 Xz56N73aiTBCDZ3Fv7fdW3JTwWhhWAh/jTxLWCwnnDLaxE6+7x3b4TRwpNiMhlXDG3Ji3uqt8u7
 12EoxxcWuDuvCum5kFnFODrBtIwNiKJ347XVkxvXnBMlJEyLP9GJa6Hvy4rvh+RA7fo0TT/LAvi
 IbYKxk/iNiYcc7
X-Received: by 2002:a05:622a:418e:b0:4d8:afdb:1283 with SMTP id
 d75a77b69052e-4ed15c47484mr6705101cf.66.1761681151364; 
 Tue, 28 Oct 2025 12:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+B3fkJotoYf8TZDvTT6DmG2RnwhQUDzDxIYeTjOWl0E+DhG6+DrycpxzJ9puTyhByx5+Rvg==
X-Received: by 2002:a05:622a:418e:b0:4d8:afdb:1283 with SMTP id
 d75a77b69052e-4ed15c47484mr6704761cf.66.1761681150785; 
 Tue, 28 Oct 2025 12:52:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f6856fsm3240936e87.68.2025.10.28.12.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 12:52:28 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:52:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
Message-ID: <da56lghirjcwesz4usdlfpttwcmvoql2h6bvjommoyfskjdkgk@hrlgx4ukt4aa>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <6381550a-4c1a-429d-b6c1-8c7ae77bf325@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6381550a-4c1a-429d-b6c1-8c7ae77bf325@linaro.org>
X-Proofpoint-GUID: E0v5I39s8nWy5HnGaltQR8Sk6rMyxyc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NyBTYWx0ZWRfX9+Im/31UseNO
 +3PtQT2QU5foWAQjXkzji2CEE2gT3LyLEncTlBTBXOGaHODsE49q839vgp3rF6watBWaIUl38bO
 pYM/PXdc5z3j4Qk3JaDKaQY92v2sNjpNoK/aWDFRiiXr62xu3ARpt+c348tiLMtn2xxAZJBl5BV
 K4dMZCBO8HqHoHaaewuow68aQ5DBCpGqQ6E1K0ERvde2qldkASDnVzQ1x2cD1f5DQyfpbHaALJ3
 GZybJu/9rCGa7l4e8m1GSDG3/ylEM0UZNJDN4kEe6TVD3/xYnJ1u7kgbExnNXNBiQ3hm2Ztz//L
 fgRMy/q1V9vbQyOuXqkZrAlcuVEzokCs1t7skVWcAtOIwVZUcg26yeQ0gZyUFbkaaViKXmKK6C1
 BhNy/fp7d0sPw9oo/WdQJOqxTohWLw==
X-Proofpoint-ORIG-GUID: E0v5I39s8nWy5HnGaltQR8Sk6rMyxyc-
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=69011f00 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=VtADSE1--9cgGQuNLtQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280167
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

On Tue, Oct 28, 2025 at 09:42:57AM +0100, neil.armstrong@linaro.org wrote:
> On 5/7/25 03:38, Jessica Zhang wrote:
> > Filter out modes that have a clock rate greater than the max core clock
> > rate when adjusted for the perf clock factor
> > 
> > This is especially important for chipsets such as QCS615 that have lower
> > limits for the MDP max core clock.
> > 
> > Since the core CRTC clock is at least the mode clock (adjusted for the
> > perf clock factor) [1], the modes supported by the driver should be less
> > than the max core clock rate.
> > 
> > [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - *crtc_clock -> *mode_clock (Dmitry)
> > - Changed adjusted_mode_clk check to use multiplication (Dmitry)
> > - Switch from quic_* email to OSS email
> > - Link to v1: https://lore.kernel.org/lkml/20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com/
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 35 ++++++++++++++++++---------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++
> >   3 files changed, 39 insertions(+), 11 deletions(-)
> > 
> 
> This test doesn't take in account if the mode is for a bonded DSI mode, which
> is the same mode on 2 interfaces doubled, but it's valid since we could literally
> set both modes separately. In bonded DSI this mode_clk must be again divided bv 2
> in addition to the fix:
> https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com/

From the docs:

         * Since this function is both called from the check phase of an atomic
         * commit, and the mode validation in the probe paths it is not allowed
         * to look at anything else but the passed-in mode, and validate it
         * against configuration-invariant hardware constraints. Any further
         * limits which depend upon the configuration can only be checked in
         * @mode_fixup or @atomic_check.

Additionally, I don't think it is correct to divide mode_clk by two. In
the end, the DPU processes the mode in a single pass, so the perf
constrains applies as is, without additional dividers.


> I'm trying to find a correct way to handle that, I have tried that:
> ===========================><========================================
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 48c3aef1cfc2..6aa5db1996e3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c

-- 
With best wishes
Dmitry
